class AdminController < ApplicationController
	
  def home
  end

  def teams
  	@team_testlines = TeamTestline.all
    @teams = Team.order(:name)
    @testlines = Testline.all
    @team = Team.new
  end

  def associations
  	@team_testlines = TeamTestline.all
    @teams = Team.order(:name)
    @testlines = Testline.all
  end

  def testlines
  	@team_testlines = TeamTestline.all
    @teams = Team.all
    @testlines = Testline.all
    @testline = Testline.new
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
