class AdminController < ApplicationController
  def home
  	@teams = Team.all
  	@testlines = Testline.all
  end
end
