require 'rails_helper'
feature 'User features ' do
    feature "user sign-up" do
        scenario 'visits sign-up page' do
            visit '/users/new'
            expect(page).to have_field('user[name]')
            expect(page).to have_field('user[email]')
            expect(page).to have_field('user[password]')
            expect(page).to have_field('user[password_confirmation]')
        end
        scenario "with improper inputs, redirects back to sign in and shows validations" do
            visit 'users/new'
            click_button "Submit"
            expect(current_path).to eq('/users/new')
            expect(page).to have_text("Invalid Inputs")
        end
        scenario "with proper inputs, create user and redirects to login page" do
            visit '/users/new'
            fill_in "user_name", with: "Jonathon"
            fill_in "user_email", with: "jonsong94@yahoo.com"
            fill_in "user_password", with: "angelica16"
            fill_in "user_password_confirmation", with: "angelica16"
            click_button "Submit"
            @user = User.last
            expect(current_path).to eq('/users/' + @user.id.to_s)
        end
    end
    feature "user dashboard" do 
        scenario "displays user information" do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            expect(page).to have_text("Jonathon")
            expect(page).to have_link("Edit Profile")
        end
    end
end
