class UserMailer < ApplicationMailer
  default :from => :host

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.email}", :subject => "Registration Confirmation")
  end
end
