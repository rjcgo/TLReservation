class ReservationsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    def create
        @testline = Testline.find(params[:testline_id])
        @reservation = @testline.reservations.create(params[:reservation].permit(:name, :released, :team_name, :description, :email))
        redirect_to(:back)
    end
    def destroy
        @testline = Testline.find(params[:testline_id]) # The testline reserved
        @reservation = @testline.reservations.find(params[:id]) # The reservation to be deleted

        if @reservation == @testline.reservations.first
            @reservation.destroy # Delete reservation
            @nextreservation = @testline.reservations.first # The next reservation
            if !@nextreservation.blank?
                @email = @nextreservation.email # Email of user who made next reservation
                NotificationMailer.notify_next(@email, @testline).deliver_now
            end
        else
            @reservation.destroy
        end
        redirect_to(:back)
    end
    def edit
    
    end
    def update
    
    end
end
