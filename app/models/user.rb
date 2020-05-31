class User < ApplicationRecord
  before_create :set_confirmation_token
  
  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
  
  private

  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:token])
    if user
      user.validate_email
      user.save(validate: false)
      redirect_to user
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to @user
    end
  end
end
