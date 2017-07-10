class ReservationsController < ApplicationController
    def create
        @testline = Testline.find(params[:testline_id])
        @reservation = @testline.reservations.create(params[:reservation].permit(:name, :released))
        redirect_to testline_path(@testline)
    end
end
