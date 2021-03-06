class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.order(:name)
  end
  
  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    @teams = Team.order(:name)
    @testlines = @team.testlines.includes(reservations: [:user, :team])

		@available = Array.new
		@used = Array.new
		@inMaintenance = Array.new
		@testlines.each do |testline|
			if testline.reservations.length == 0 && !testline.isMaintenance?
				@available.push(testline)
			elsif testline.reservations.length != 0 && !testline.isMaintenance?
				@used.push(testline)
			elsif testline.isMaintenance?
				@inMaintenance.push(testline)
			end
		end
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to admin_teams_path, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { redirect_to admin_teams_path, notice: parse_notice(@team.errors) }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to admin_teams_path, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { redirect_to admin_teams_path, notice: parse_notice(@team.errors) }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])

    # Delete associations of all testlines to this team
    @myassociations = TeamTestline.where(team_id: params[:id])
    @myassociations.each do |a|
      a.delete
    end
    # Delete the team
    @team.destroy
    
    respond_to do |format|
      format.html { redirect_to admin_teams_path, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end
