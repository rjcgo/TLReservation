class TeamTestlinesController < ApplicationController
  before_action :set_team_testline, only: [:show, :edit, :update, :destroy]

  # GET /team_testlines
  # GET /team_testlines.json
  def index
    @team_testlines = TeamTestline.all
    @teams = Team.all
    @testlines = Testline.all
  end

  # GET /team_testlines/1
  # GET /team_testlines/1.json
  def show
  end

  # GET /team_testlines/new
  def new
    @team_testline = TeamTestline.new
  end

  # GET /team_testlines/1/edit
  def edit
  end

  # POST /team_testlines
  # POST /team_testlines.json
  def create
    @team_testline = TeamTestline.new(team_testline_params)

    respond_to do |format|
      if @team_testline.save
        format.html { redirect_to admin_associations_path, notice: 'Association was successfully established.' }
        format.json { render :show, status: :created, location: @team_testline }
      else
        format.html { redirect_to admin_associations_path, notice: parse_notice(@team_testline.errors) }
        format.json { render json: @team_testline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_testlines/1
  # PATCH/PUT /team_testlines/1.json
  def update
    respond_to do |format|
      if @team_testline.update(team_testline_params)
        format.html { redirect_to admin_associations_path, notice: 'Association was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_testline }
      else
        format.html { redirect_to admin_associations_path, notice: parse_notice(@team_testline.errors) }
        format.json { render json: @team_testline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_testlines/1
  # DELETE /team_testlines/1.json
  def destroy
    @team_testline.destroy
    respond_to do |format|
      format.html { redirect_to admin_associations_path, notice: 'Association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_testline
      @team_testline = TeamTestline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_testline_params
      params.require(:team_testline).permit(:team_id, :testline_id)
    end
end
