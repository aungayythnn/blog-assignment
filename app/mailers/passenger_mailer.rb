class PassengerMailer < ApplicationMailer

  def confirmation_email
    @user = params[:user]
    mail(to: @user.email, subject: "Confirmation email for flight ticket")
  end
end
