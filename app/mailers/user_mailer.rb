class UserMailer < ApplicationMailer
  default :from => "user_registration@domain.com"

  def registration_confirmation(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(:to => user.email, :subject => "Registration Confirmation")
  end
  
  def confirmation_reminder(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(:to => user.email, :subject => "Confirmation Reminder")
  end
end
