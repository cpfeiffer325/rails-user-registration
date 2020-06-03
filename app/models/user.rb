class User < ApplicationRecord
  has_secure_password
  # before_save :create_gravatar_url
  before_create :set_confirmation_token

  # make gravatar available to Users
  include Gravtastic
  gravtastic :secure => false, :default => 'retro', :filetype => :gif, :size => 120

  def confirm_email
    user = User.find_by_confirm_token(params[:token])
    if user_params
      user.email_activate
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
  
  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
