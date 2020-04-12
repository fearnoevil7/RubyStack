require 'rails_helper'
RSpec.describe UsersController, type: :controller do
    before do
    @user = create(:user, email: "jonsong94@yahoo.com", name:"Jonathon", password:"angelica16")
    end
    context "when not logged in" do
    before do
        session[:user_id] = nil
    end
    it "cannot access show" do 
        get :index, id: @user
        expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access edit" do
        get :edit, id:@user
        expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access update" do
        patch :update, id:@user
        expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access destroy" do
        delete :destroy, id:@user
        expect(response).to redirect_to("/sessions/new")
    end
    end
    context "when signed in as the wrong user" do
        before do
            @user = create(:user, email: "hkappy94@yahoo.com", name:"Jonathon", password:"happyhappy23")
            @secret = create(:secret, content:"I cant iceskate", user:@user)
        end
        it "cannot access profile page another user" do
        # @user = create(:user, email: "jonsong94@yahoo.com", name:"Jonathon", password:"angelica16")
        @user2 = create(:user, email: "Tesssong94@yahoo.com", name: "Tess", password:"jaepilsong16")
        session['user_id'] = @user2.id
        get :index, id: @user
        expect(response).to redirect_to('/logout')
        # @secret2 = create(:secret, user: @user2, content: "Lets make this content unique")
        # visit 'sessions/new'
        # fill_in "email", with: "jonsong94@yahoo.com"
        # fill_in "password", with: "angelica16"
        # click_button "Submit"
        end
        it "cannot access the edit page of another user" do
            @user2 = create(:user, email: "Tesssong94@yahoo.com", name: "Tess", password:"jaepilsong16")
            session['user_id'] = @user2.id
            get :edit, id: @user
            expect(response).to redirect_to('/logout')
        end
        it "cannot update another user" do
            @user2 = create(:user, email: "Tesssong94@yahoo.com", name: "Tess", password:"jaepilsong16")
            session['user_id'] = @user2.id
            patch :update, id: @user
            expect(response).to redirect_to('/logout')
        end
        it "cannot destroy another user" do
            @user2 = create(:user, email: "Tesssong94@yahoo.com", name: "Tess", password:"jaepilsong16")
            session['user_id'] = @user2.id
            delete :destroy, id: @user
            expect(response).to redirect_to('/logout')
        end
    end
end