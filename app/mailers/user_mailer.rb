class UserMailer < ApplicationMailer
  default :from => "application_name@domain.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.email}", :subject => "Registration Confirmation")
  end
end
