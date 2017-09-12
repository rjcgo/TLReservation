class UserController < ApplicationController
    before_action :authenticate_user! 
  
    def assign_team
        current_user.team = Team.find(params[:team_id])
        current_user.save
        redirect_to reservations_path
    end
end