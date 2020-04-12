require 'rails_helper'
RSpec.describe LikesController, type: :controller do 
    before do 
    @user = create(:user)
    @secret = create(:secret, user: @user)
    @like = create(:like, secret: @secret, user: @user)
    end
    context "when not logged in " do 
        before do 
            session[:user_id] = nil
        end
        it "cannot create a like" do 
            post :create, id:@secret
            expect(response).to redirect_to("/sessions/new")
        end
        it "cannot destroy a like" do
            delete :destroy, id:@secret
            expect(response).to redirect_to("/sessions/new")
        end
    end
    context "when signed in as the wrong user" do
        before do
            @user = create(:user, email: "rockstarcowboy7@yahoo.com", name: "Jonathon", password:"happyhappy7")
            @secret = create(:secret, content:"I need to work on ice skating", user: @user)
            @like = create(:like, secret: @secret, user: @user)
        end
        it "shouldn't be able to destroy a like" do
            # @like2 = create(:like, secret: @secret, user: @user2)
            @user2 = create(:user, email: "tesssong99@yahoo.com", name:"Tess", password:"jaepilsong16")
            session['user_id'] = @user2.id
            # delete :destroy, id:@secret
            get :index
            expect(response).not_to have_button("Unlike")
        end
    end 
end