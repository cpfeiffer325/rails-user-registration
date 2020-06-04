class User < ApplicationRecord
  has_secure_password
  before_create :set_confirmation_token

  # make gravatar available to Users
  include Gravtastic
  gravtastic :secure => false, :default => 'retro', :filetype => :gif, :size => 120

  private
  
  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
