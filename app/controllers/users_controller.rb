class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    create_user_service = CreateUser.new(user_params)
    @user = create_user_service.create_user

    # @user = User.new(user_params)

    if @user
      # @user.set_confirmation_token
      # @user.save(validate: false)
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Please check your email to confirm your address to continue"
      redirect_to root_url
    else
      flash[:error] = "Aaaaah, something is missing. Sending you back to register properly"
      redirect_to 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, 
      :password
    )
  end
end

# CreateUser.new(email: "c_pfeifer325@yahoo.ca", password: "abc123").create_user;
