require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
    before do
    @user = create(:user)
    @secret = create(:secret, user: @user)
    end
    feature "when not logged in" do
    before do
        session[:user_id] = nil
    end
    scenario "cannot access index" do
        get :index
        expect(response).to redirect_to("/sessions/new")
    end
    scenario "cannot access create" do
        post :create, id:@user
        expect(response).to redirect_to("/sessions/new")
    end
    scenario "cannot access destroy" do
        delete :destroy, id:@secret
        expect(response).to redirect_to("/sessions/new")
    end
    end
end