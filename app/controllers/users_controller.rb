class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def show
    @user = User.find(params[:id])

    if current_user != @user
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
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
      UsersReminderJob.set(wait: 24.hours).perform_later(@user)
      flash[:success] = "Please check your email to confirm your address to continue"
      redirect_to '/welcome'
    else
      flash[:error] = "Aaaaah, something is missing. Sending you back to register properly"
      redirect_to 'new'
    end
  end

  def confirm_email
    @user = User.find_by(confirm_token: params[:id])
    if @user
      @user.email_activate
      flash[:success] = 'Welcome to the User Registration App'
      redirect_to @user
    else
      flash[:error] = 'Error: User does not exist'
      redirect_to '/welcome'
    end
  end
  
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

  def user_params
    params.require(:user).permit(
      :email, 
      :password,
      :email_confirmed,
    )
  end
end

# CreateUser.new(email: "c_pfeifer325@yahoo.ca", password: "abc123").create_user;
