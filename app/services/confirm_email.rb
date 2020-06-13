class ConfirmEmail
  def initialize token: #verify
    @token = token
  end
  
  def confirm_email
    @user = User.find_by(confirm_token: @token)
    @user.email_activate if @user
    @user
  end
end

#url /confirm?token=:token
