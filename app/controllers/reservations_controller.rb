require 'logger'

class ReservationsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def create
        @testline = Testline.find_by_id(params[:testline_id])
        @reservation = @testline.reservations.create(
            params[:reservation].permit(:name, :released, :team_id, :description)
                .merge(user_id: current_user.id))

        if @reservation == @testline.reservations.first
            @reservation.start_time = DateTime.now
            @reservation.save
            logger = Logger.new('public/reservations.log', 'weekly')
            logger.datetime_format = '%Y-%m-%d %H:%M:%S'
            logger.level = Logger::INFO
            logger.formatter = proc do |severity, datetime, progname, msg|
              "#{datetime}: #{msg}\n"
            end

            logger.info(@testline.name + " used by " + @reservation.user.email + " of team " + @reservation.team.name)
            logger.close()
        end
        redirect_to(:back)
    end
    def destroy
        @testline = Testline.find_by_id(params[:testline_id]) # The testline reserved
        @reservation = @testline.reservations.find(params[:id]) # The reservation to be deleted
        
        logger = Logger.new('public/reservations.log', 'weekly')
        logger.datetime_format = '%Y-%m-%d %H:%M:%S'
        logger.level = Logger::INFO
        logger.formatter = proc do |severity, datetime, progname, msg|
          "#{datetime}: #{msg}\n"
        end

        if @reservation == @testline.reservations.first
            logger.info(@testline.name + " released by " + @reservation.user.email + " of team " + @reservation.team.name)
            @reservation.destroy # Delete reservation
            @nextreservation = @testline.reservations.first # The next reservation
            if !@nextreservation.blank?
                Thread.new{
                    @email = @nextreservation.user.email # Email of user who made next reservation
                    NotificationMailer.notify_next(@email, @testline).deliver_now
                }
                @nextreservation.start_time = DateTime.now
                @nextreservation.save

                logger.info(@testline.name + " used by " + @email + " of team " + @nextreservation.team.name)
                logger.close()
            end
        else
            @reservation.destroy
        end
        respond_to do |format|
          format.html { redirect_to :back, notice: 'Reservation was successfully deleted.' }
          format.json { head :no_content }
        end
    end
    def edit
    
    end
    def update
    
    end

    def download_log_file
      send_file("public/reservations.log", filename: "reservations.log", type: "log")
    end
end
