class ConfirmController < ApplicationController
  def index
    token = params[:token]
    confirm_email_service = ConfirmEmail.new(token: token)
    user = confirm_email_service.confirm_email
    if user
      flash[:success] = 'Welcome to the User Registration App'
      redirect_to user
    else
      flash[:error] = 'Error: User does not exist'
      redirect_to '/welcome'
    end
  end
end


