class ReservationsController < ApplicationController
  def new
    @post = Post.new
    
  end

  def edit
  end

  def index
  	@reservations = Reservation.all
  end

  def show
  	@reservations = Reservation.find(params[:id])
  end

  def create 
     @reservations = Reservation.create(params[:post])
    

  end
end
