class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      if @user.email_confirmed
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:error] = 'Please activate your account'
        redirect_to '/login'
      end
    else
      redirect_to '/login', flash: "Username or Password was wrong"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/welcome', notice: "Logged out!"
  end
end
