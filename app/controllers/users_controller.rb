class UsersController < ApplicationController
  before_action :only_see_own_page, only: [:show]
  skip_before_action :authorized, only: [:new, :create]

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    create_user_service = CreateUser.new(user_params.merge(email_confirmed: false))
    @user = create_user_service.create_user
    
    session[:user_id] = @user.id

    if @user
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Please check your email to confirm your address to continue"
      redirect_to '/welcome'
    else
      flash[:error] = "Aaaaah, something is missing. Sending you back to register properly"
      redirect_to 'new'
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

  def only_see_own_page
    @user = User.find(params[:id])

    if current_user != @user
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end
end

# CreateUser.new(email: "c_pfeifer325@yahoo.ca", password: "abc123").create_user;
