class User < ApplicationRecord
  has_secure_password
  before_create :set_confirmation_token
  validates :email, presence: true
  validates :password, presence: true

  def gravatar_url
    "https://secure.gravatar.com/avatar/#{self.email_hash}?s=200&r=pg&d=robohash"
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
