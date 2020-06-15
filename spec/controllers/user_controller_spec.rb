require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    let(:user) { User.new(id: 1)}
    let(:user_params) {{ :user => { email: "email@test.com", password: "abc123" } }}
    let(:create_user_service) { double("create_user_service") }
    
    before(:each) do
      expect(CreateUser).to receive(:new).and_return(create_user_service)
    end

    context "when create user succeeds" do
      before(:each) do
        expect(create_user_service).to receive(:create_user).and_return(user)
      end
  
      it "redirect to welcome" do
        post :create, params: user_params
        expect(response).to redirect_to("/welcome")
      end
      
      it "sets user_id in session" do
        post :create, params: user_params
        expect(session[:user_id]).to eq(user.id)
      end
      
      it "flash success" do
        post :create, params: user_params
        expect(flash[:success]).to eq("Please check your email to confirm your address to continue")
      end
    end
    
    context "when create_user raises an error" do
      before(:each) do
        expect(create_user_service).to receive(:create_user).and_raise(StandardError)
      end
      
      it "flash error" do
        post :create, params: user_params
        expect(flash[:error]).to eq("Aaaaah, something is missing. Sending you back to register properly")
      end
  
      it "redirect to new" do
        post :create, params: user_params
        expect(response).to redirect_to("/login")
      end
    end
  end

  describe "GET #show" do
    let(:user) { User.new(id: 1) }

    before(:each) do
      allow(controller).to receive(:current_user).and_return(user)
      allow(User).to receive(:find).with(user.id.to_s).and_return(user)
    end
    
    it "renders status 200" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
    end
    
    context "when showing other user" do
      let(:other_user) { User.new(id: 2) }

      before(:each) do
        allow(controller).to receive(:current_user).and_return(other_user)
      end
      
      it "renders status 302" do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(302)
      end
    end
  end
end
