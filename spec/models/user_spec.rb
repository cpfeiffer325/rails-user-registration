require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'should save successfully' do
      user = User.new(email: 'test@email.com', password: 'testing').save
      expect(user).to eq(true)
    end
  end

  context 'set confirmation token' do
    let(:confirm_token) { SecureRandom.urlsafe_base64.to_s }
    let(:user) { User.new(email: "email@test.com", password: "abc1223", confirm_token: confirm_token) }

    before(:each) do 
      user.save 
    end

    it 'should have a confirm token' do
      expect(user).to have_attributes(confirm_token: confirm_token)
    end
  end
end
