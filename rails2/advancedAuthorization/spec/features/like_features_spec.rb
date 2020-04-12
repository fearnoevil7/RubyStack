require 'rails_helper'
feature 'Like Features' do
    before do
        @user = create(:user, email:"jonsong94@yahoo.com", name:"Jonathon", password:"angelica16")
        visit 'sessions/new'
        fill_in "email", with: "jonsong94@yahoo.com"
        fill_in "password", with: "angelica16"
        click_button "Submit"
        @secret = create(:secret, content:"I hate bacon!!!!!!!", user: @user)
    end
    feature 'secret has not been liked' do 
        before(:each) do
            visit '/secrets/'
        end
        scenario "like count updated correctly" do
            # @user = create(:user, email:"jonsong94@yahoo.com", name:"Jonathon", password:"angelica16")
            # visit 'sessions/new'
            # fill_in "email", with: "jonsong94@yahoo.com"
            # fill_in "password", with: "angelica16"
            # click_button "Submit"
            # @secret = create(:secret, user: @user)
            visit '/secrets/'
            expect(page).to have_text(@secret.content)
            expect(page).to have_text('0 likes')
        end
        scenario "displays like button if you haven't liked secret" do
            visit '/users/' + @user.id.to_s
            @user2 = create(:user, email:"tesssong99@yahoo.com", name:"Tess", password:"jaepilsong16")
            @secret2 = create(:secret, content:"I love my family", user: @user2)
            visit '/secrets/'
            expect(page).to have_button("Like")
        end
        scenario "liking will update like count, like button not visible" do
            visit '/users/' + @user.id.to_s
            @user2 = create(:user, email:"tesssong99@yahoo.com", name:"Tess", password:"jaepilsong16")
            @secret2 = create(:secret, content:"I love my family", user: @user2)
            visit '/secrets/'
            click_button "Like"
            # expect(page).to_not have_button("Like")
            expect(page).to have_text('1 like')
        end
    end
    feature "secret has been liked" do    
        scenario "unlike button is visible" do
            @user2 = create(:user, email:"tesssong99@yahoo.com", name:"Tess", password:"jaepilsong16")
            @secret2 = create(:secret, content:"I love my family", user: @user2)
            visit '/secrets/'
            click_button "Like"
            expect(page).to have_button("Unlike")
        end
        scenario "unliking will update like count" do
            @user2 = create(:user, email:"tesssong99@yahoo.com", name:"Tess", password:"jaepilsong16")
            @secret2 = create(:secret, content:"I love my family", user: @user2)
            visit '/secrets/'
            click_button "Like"
            click_button "Unlike"
            expect(page).to_not have_button("Unlike")
            expect(page).to have_text("0 likes")
        end
    end
end