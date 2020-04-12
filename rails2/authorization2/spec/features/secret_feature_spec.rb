require 'rails_helper'
feature "secret features" do
    # before do
    #     @user = create(:user, email: "jonsong94@yahoo.com", name:"Jonathon", password:"angelica16")
    #     @user2 = create(:user, email: "Tesssong94@yahoo.com", name: "Tess", password:"jaepilsong16")
    #     @secret2 = create(:secret, user: @user2, content: "Lets make this content unique")
    #     visit "/sessions/new"
    #     fill_in "email", with: "jonsong94@yahoo.com"
    #     fill_in "password", with: "angelica16"
    #     click_button "Submit"
    # end
    feature "Users personal secret page" do
        # before do
        #     visit "/users/#{@user.id}"
        # end
        scenario "shouldn't see other user's secrets" do
        @user = create(:user, email: "jonsong94@yahoo.com", name:"Jonathon", password:"angelica16")
        @user2 = create(:user, email: "Tesssong94@yahoo.com", name: "Tess", password:"jaepilsong16")
        @secret2 = create(:secret, user: @user2, content: "Lets make this content unique")
        visit 'sessions/new'
        fill_in "email", with: "jonsong94@yahoo.com"
        fill_in "password", with: "angelica16"
        click_button "Submit"
        visit "/users/#{@user.id}"
        expect(page).not_to have_text(@secret2.content)
        end
        scenario "create a new secret" do
            @user = create(:user, email: "jonsong94@yahoo.com", name:"Jonathon", password:"angelica16")
            visit 'sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            fill_in 'secret[content]', with: "My new secret"
            click_button 'Create Secret'
            expect(current_path).to eq("/users/#{@user.id}")
            expect(page).to have_text('My new secret')
        end
        scenario "destroy secret from profile page, redirects to user profile page"do
            @user = create(:user, email: "jonsong94@yahoo.com", name:"Jonathon", password:"angelica16")
            visit 'sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            secret = create(:secret, user: @user)
            visit "/users/#{@user.id}"
            click_button 'Delete Secret'
            expect(current_path).to eq("/users/#{@user.id}")
            expect(page).not_to have_text(secret.content)
        end
    end
    feature "Secret Dashboard" do 
        scenario "displays everyone's secrets" do
            @user = create(:user, email: "jonsong94@yahoo.com", name:"Jonathon", password:"angelica16")
            @user2 = create(:user, email: "Tesssong94@yahoo.com", name: "Tess", password:"jaepilsong16")
            @secret = create(:secret, user: @user)
            @secret2 = create(:secret, user: @user2, content: "Lets make this content unique")
            visit 'sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            visit '/secrets/'
            expect(page).to have_text(@secret.content)
            expect(page).to have_text(@secret2.content)
        end
        scenario "destroy secret from index page, redirects to user profile page" do
            @user = create(:user, email: "jonsong94@yahoo.com", name:"Jonathon", password:"angelica16")
            @user2 = create(:user, email: "Tesssong94@yahoo.com", name: "Tess", password:"jaepilsong16")
            @secret = create(:secret, user: @user)
            @secret2 = create(:secret, user: @user2, content: "Lets make this content unique")
            visit 'sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            visit '/secrets/'
            click_button 'Delete'
            expect(current_path).to eq("/users/#{@user.id}")
            expect(page).not_to have_text(@secret.content)
        end
    end
end