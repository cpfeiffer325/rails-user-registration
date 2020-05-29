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
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(
      :email, 
      :password
    )
  end
end
