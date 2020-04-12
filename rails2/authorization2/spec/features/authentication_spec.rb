require 'rails_helper'
feature 'authentication feature' do
    feature "user attempts to sign-in" do
        scenario 'visits sign-in page, prompted with email and password fields' do
            visit '/sessions/new'
            expect(page).to have_field('email')
            expect(page).to have_field('password')
        end
        scenario 'logs in user if email/password combination is valid' do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            expect(current_path).to eq('/users/' + user.id.to_s)
            expect(page).to have_text('Jonathon')
        end
        scenario 'does not sign in user if email is not found' do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with:""
            fill_in "password", with: "angelica16"
            click_button "Submit"
            expect(current_path).to eq('/sessions/new')
            expect(page).to have_text('Invalid Combination')
        end
        scenario 'does not sign in user if email/password combination is invalid' do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with:"tessong99@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            expect(current_path).to eq("/sessions/new")
            expect(page).to have_text('Invalid Combination')
        end
    end
    feature "user attempts to log out" do
        # before do
        #     user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
        #     # visit '/sessions/new'
        #     # fill_in "email", with: "jonsong94@yahoo.com"
        #     # fill_in "password", with: "angelica16"
        #     # click_button "Submit"
        # end
        scenario 'displays "Log Out" button when user is logged on' do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            expect(current_path).to eq("/users/" + user.id.to_s)
            expect(page).to have_button('Log Out')
        end
        scenario 'logs out user and redirects to login page' do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            click_button 'Log Out'
            expect(current_path).to eq('/sessions/new')
        end
    end
end