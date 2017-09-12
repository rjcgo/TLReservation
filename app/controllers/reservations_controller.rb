require 'logger'

class ReservationsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    # GET /reservations/new
    def new
        @reservation = Reservation.new
        @testline = Testline.includes(:teams).find(params[:testline_id])
        @teams = @testline.teams
    end

    def create
        @testline = Testline.find(params[:testline_id])
        @reservation = @testline.reservations.create(
            params[:reservation].permit(:name, :released, :description)
                .merge(user_id: current_user.id, team_id: current_user.team.id))

        params[:recipient][:email].delete("")
        if !params[:recipient][:email].empty?
            params[:recipient][:email].each do |recipient_email|
                @reservation.recipients.build(email: recipient_email)
            end
            @reservation.save
        end

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
        @testline = Testline.find(params[:testline_id]) # The testline reserved
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
                # mails the recipients of the next team in line for the testline
                @nextreservation.recipients.each do |recipient|
                    Thread.new{
                        NotificationMailer.notify_next(recipient.email, @testline).deliver_now
                    }
                end
                # mails the team members of the next team in line for the testline
                @nextreservation.team.users.each do |team_members|
                    Thread.new{
                        NotificationMailer.notify_next(team_members.email, @testline).deliver_now
                    }
                end
                # starts the time of the next reservation
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
