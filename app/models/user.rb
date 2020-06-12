class User < ApplicationRecord
  has_secure_password
  before_create :set_confirmation_token

  def gravatar_url
    "https://secure.gravatar.com/avatar/#{self.email_hash}?s=200&r=pg&d=robohash"
  end

  private
  
  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
