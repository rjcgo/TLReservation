class AdminController < ApplicationController
  before_action :authenticate_user! 
  
  def home
  end

  def teams
  	@team_testlines = TeamTestline.all
    @teams = Team.order(:name)
    @testlines = Testline.order(:name)
    @team = Team.new
  end

  def associations
    @teams = Team.order(:name)
    @testlines = Testline.order(:name).includes(:teams)
  end

  def testlines
  	@team_testlines = TeamTestline.all
    @teams = Team.all
    @testlines = Testline.order(:name)
    @testline = Testline.new
    @reservations = Reservation.all
  end

  def users
    @users = User.all
  end

  def makeAdmin
    @user = User.find(params[:format])
    @user.isAdmin = true;
    @user.save
    redirect_to admin_users_path
  end

end
