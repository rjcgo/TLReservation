class AdminController < ApplicationController
	
  def home
  end

  def teams
  	@team_testlines = TeamTestline.all
    @teams = Team.all
    @testlines = Testline.all
  end

  def associations
  	@team_testlines = TeamTestline.all
    @teams = Team.all
    @testlines = Testline.all
  end

  def testlines
  	@team_testlines = TeamTestline.all
    @teams = Team.all
    @testlines = Testline.all
  end

  def users
    @users = User.all
  end
end
