class UsersReminderJob < ApplicationJob
  queue_as :default

  def perform(user)
    if user.email_confirmed == false
      UserMailer.confirmation_reminder(user).deliver
    end
  end
end
