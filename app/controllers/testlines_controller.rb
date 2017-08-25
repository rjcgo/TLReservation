class TestlinesController < ApplicationController
  before_action :set_testline, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  # GET /testlines
  # GET /testlines.json
  def index
  end

  # GET /testlines/1
  # GET /testlines/1.json
  def show
  end

  # GET /testlines/new
  def new
    @testline = Testline.new
  end

  # GET /testlines/1/edit
  def edit
    @testline = Testline.find(params[:id])
  end

  # POST /testlines
  # POST /testlines.json
  def create
    @testline = Testline.new(testline_params)

    respond_to do |format|
      if @testline.save
        format.html { redirect_to admin_testlines_path, notice: 'Test line was successfully created.' }
        format.json { render :show, status: :created, location: @testline }
      else
        format.html { redirect_to admin_testlines_path, notice: parse_notice(@testline.errors) }
        format.json { render json: @testline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testlines/1
  # PATCH/PUT /testlines/1.json
  def update
    respond_to do |format|
      if @testline.update(testline_params)
        format.html { redirect_to admin_testlines_path, notice: 'Test line was successfully updated.' }
        format.json { render :show, status: :ok, location: @testline }
      else
        format.html { redirect_to admin_testlines_path, notice: parse_notice(@testline.errors) }
        format.json { render json: @testline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testlines/1
  # DELETE /testlines/1.json
  def destroy

    # Delete associations of all teams with this testline
    @myassociations = TeamTestline.where(testline_id: params[:id])
    @myassociations.each do |a|
      a.delete
    end

    # Delete all reservations associated with this testline
    @myreservations = Reservation.where(testline_id: params[:id])
    @myreservations.each do |r|
      r.delete
    end

    # Delete the testline
    @testline.destroy
    respond_to do |format|
      format.html { redirect_to admin_testlines_path, notice: 'Test line was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  # GET /reservations
  def reservations
    @testlines = Testline.order(:name).includes(:teams, reservations: [:user, :team])
  end

  # POST /testlines/:id/teams
  def addTeam
    testline = Testline.find(params[:id])
    params[:teams].each do |team|
      testline.teams << Team.find(team)
    end

    respond_to do |format|
      if testline.save
        format.html { redirect_to admin_associations_path, 
          notice: 'Access to testline was successfully granted.' }
        format.json { render :show, status: :created, location: testline.errors }
      else
        format.html { redirect_to admin_associations_path, notice: parse_notice(testline.errors) }
        format.json { render json: testline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testlines/:testline_id/teams/:team_id
  def removeTeam
    testline = Testline.find(params[:testline_id])
    testline.teams.delete(Team.find(params[:team_id]))

    testline.reservations.delete(Reservation.where(team_id: params[:team_id]))
    respond_to do |format|
      format.html { redirect_to admin_associations_path, notice: 'Test line was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testline
      @testline = Testline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testline_params
      params.require(:testline).permit(:name, :ip_address, :port_number, :isMaintenance, :description, :diagram, :remove_diagram)
    end
end
