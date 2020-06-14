class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :load_user, only: [:show]

  def show
    if current_user != @user
      redirect_to root_path, notice: "Sorry, but you are ONLY allowed to view your own profile page."
    end
  end
  
  def new
    @user = User.new
  end

  def create
    create_user_service = CreateUser.new(user_params.merge(email_confirmed: false)) # needs to be specified since the default is set to true for when user is created by admin
    begin
      @user = create_user_service.create_user
      session[:user_id] = @user.id
      flash[:success] = "Please check your email to confirm your address to continue"
      redirect_to '/welcome'
    rescue
      flash[:error] = "Aaaaah, something is missing. Sending you back to register properly"
      redirect_to '/login'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, 
      :password,
      :email_confirmed,
    )
  end

  def load_user
    @user = User.find(params[:id])
  end
end
