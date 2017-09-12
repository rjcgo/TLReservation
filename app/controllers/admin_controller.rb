class AdminController < ApplicationController
  before_action :authenticate_user! 
  
  def home
  end

  def teams
  	@team_testlines = TeamTestline.all
    @teams = Team.order(:name).includes(:users)
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
  
  def make_admin
    @user = User.find(params[:id])
    @user.isAdmin = true;
    @user.save
    redirect_to admin_users_path
  end

  def edit_assigned_team
    @user = User.find(params[:id])
    @teams = Team.order(:name)
  end

  def update_assigned_team
    @user = User.find(params[:id])
    @user.team = Team.find(params[:team_id])
    @user.save
    redirect_to admin_users_path
  end
end
