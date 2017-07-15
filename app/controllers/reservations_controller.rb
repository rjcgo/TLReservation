class ReservationsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    def create
        @testline = Testline.find(params[:testline_id])
        @reservation = @testline.reservations.create(params[:reservation].permit(:name, :released, :team_name, :description, :email))
        redirect_to(:back)
    end
    def destroy
        @testline = Testline.find(params[:testline_id])
        @reservation = @testline.reservations.find(params[:id])
        @reservation.destroy
        redirect_to(:back)
    end
    def edit
    
    end
    def update
    
    end
end
