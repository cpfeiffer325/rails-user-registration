require 'rails_helper'

RSpec.describe UsersController do
  let(:current_user) { User.new(id: 1, email_confirmed: true) }

  describe "POST #new" do
    it 'should create a new user' do
      user = User.new(email: 'test@email.com', password: 'testing').save
      expect(user).to eq(true)
    end
  end

  describe "GET #show" do
    it "renders status 200" do
      expect(response).to have_http_status(200)
    end
  end
end
