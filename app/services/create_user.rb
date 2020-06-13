class CreateUser
  def initialize params # if working update for @email
    @params = params
  end

  def create_user
    user = User.create(@params.merge(email_hash: email_hash))
    # UserMailer.registration_confirmation(user).deliver
    # UsersReminderJob.set(wait: 24.hours).perform_later(@user)
  end

  private

  def email_hash
    Digest::MD5.hexdigest(@params[:email])
  end
end
