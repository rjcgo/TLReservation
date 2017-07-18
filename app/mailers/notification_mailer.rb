class NotificationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notify_next.subject
  #
  def notify_next(email, testline)
    @email = email
    @testline = testline
    mail(   :to      => @email,
            :from    => "tlreservation.nokinterns@outlook.com",
            :subject => @testline.name+" has been released")
  end
end
