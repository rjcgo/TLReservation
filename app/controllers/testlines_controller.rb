class TestlinesController < ApplicationController
  before_action :set_testline, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  # GET /testlines
  # GET /testlines.json
  def index
    @testlines = Testline.all
    @reservations = Reservation.all
    @teams = Team.all
    
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
  end

  # POST /testlines
  # POST /testlines.json
  def create
    @testline = Testline.new(testline_params)

    respond_to do |format|
      if @testline.save
        format.html { redirect_to admin_testlines_path, notice: 'Testline was successfully created.' }
        format.json { render :show, status: :created, location: @testline }
      else
        format.html { render :new }
        format.json { render json: @testline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testlines/1
  # PATCH/PUT /testlines/1.json
  def update
    respond_to do |format|
      if @testline.update(testline_params)
        format.html { redirect_to @testline, notice: 'Testline was successfully updated.' }
        format.json { render :show, status: :ok, location: @testline }
      else
        format.html { render :edit }
        format.json { render json: @testline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testlines/1
  # DELETE /testlines/1.json
  def destroy
    @testline.destroy
    respond_to do |format|
      format.html { redirect_to admin_testlines_path, notice: 'Testline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

# def destroy
#     @testline = Testline.find(params[:id])
#     @testline.destroy!
#     redirect_to root_path, :notice => "Deleted!!!!!!!!!!!"
# end


  # def destroy
  #   @testline = Testline.find(params[:id])
  
  #   respond_to do |format|
  #     if @testline.destroy
  #       format.html { redirect_to testlines_url }
  #       format.json { head :no_content }
  #     else
  #       format.html # do something here
  #       format.json { head :no_content }
  #     end
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testline
      @testline = Testline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testline_params
      params.require(:testline).permit(:name)
    end
end
