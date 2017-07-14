class HomeController < ApplicationController
  def index
  	@teams = Team.order(:name)
  end
end
