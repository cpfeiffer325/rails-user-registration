require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    # subject { 
    #   User.new(email: "test@email.com", password: "abc123") 
    # }

    # it { is_expected.to validate_presence_of(:password) }
    # it { is_expected.to validate_presence_of(:email) } # why won't this work ?

    subject { described_class.new(email: "test@email.com", password: "abc123") }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid with missing email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    
    it "is not valid with missing password" do
      subject.password = nil
      expect(subject).to_not be_valid
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
