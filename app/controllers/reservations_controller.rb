require 'logger'

class ReservationsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    def create
        @testline = Testline.find(params[:testline_id])
        @reservation = @testline.reservations.create(params[:reservation].permit(:name, :released, :team_name, :description, :email))

        if @reservation == @testline.reservations.first
            @reservation.start_time = DateTime.now
            @reservation.save
            #logger = Logger.new("#{$ROOT_PATH}/log/errors.log", 'daily')  
            logger = Logger.new('public/reservations.log', 'daily')
            logger.level = Logger::INFO
            logger.datetime_format = '%Y-%m-%d %H:%M:%S'

            logger.info(@testline.name + " used by " + @reservation.email + " of team " + @reservation.team_name)
            logger.close()
        end
        redirect_to(:back)
    end
    def destroy
        @testline = Testline.find(params[:testline_id]) # The testline reserved
        @reservation = @testline.reservations.find(params[:id]) # The reservation to be deleted

         #logger = Logger.new("#{$ROOT_PATH}/log/errors.log", 'daily')  
        logger = Logger.new('public/reservations.log', 'daily')
        logger.level = Logger::INFO
        logger.datetime_format = '%Y-%m-%d %H:%M:%S'

        if @reservation == @testline.reservations.first
            @reservation.destroy # Delete reservation
            @nextreservation = @testline.reservations.first # The next reservation
            if !@nextreservation.blank?
                @email = @nextreservation.email # Email of user who made next reservation
                NotificationMailer.notify_next(@email, @testline).deliver_now
                @nextreservation.start_time = DateTime.now
                @nextreservation.save

                logger.info(@testline.name + " used by " + @email + " of team " + @nextreservation.team_name)
                logger.close()
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

    def download_log_file
      send_file("/public/reservations.log", filename: "reservations.log", type: "log")
    end
end
