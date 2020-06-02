class UserMailer < ApplicationMailer
  default :from => "user_registration@domain.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Registration Confirmation")
  end
end
