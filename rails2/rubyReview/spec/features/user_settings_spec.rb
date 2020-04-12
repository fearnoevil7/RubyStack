require 'rails_helper'
feature 'User features ' do
    feature "User Settings Dashboard" do
        scenario "visit users edit page" do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            click_link "Edit Profile"
            expect(page).to have_text("Jonathon")
            expect(current_path).to eq("/users/" + user.id.to_s + "/edit")
        end
        scenario "inputs filled out correctly" do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            # @user = User.last
            click_link "Edit Profile"
            expect(find_field('user[name]').value).to eq("Jonathon")
            expect(find_field('user[email]').value).to eq("jonsong94@yahoo.com")
        end
        scenario "incorrectly updates information" do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            click_link "Edit Profile"
            fill_in "user[name]", with: "Alex"
            fill_in "user[email]", with: "jonathon"
            click_button "Update"
            expect(current_path).to eq("/users/" + user.id.to_s + "/edit")
            expect(page).to have_text("Email is invalid")
        end
        scenario "correctly updates information" do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            click_link "Edit Profile"
            fill_in "user[name]", with: "Tess"
            fill_in "user[email]", with: "tessong99@yahoo.com"
            click_button "Update"
            expect(page).to have_text("Tess")
        end
        scenario "destroys user and redirects to registration page" do
            user = User.create(name: "Jonathon", email:"jonsong94@yahoo.com", password:"angelica16")
            visit '/sessions/new'
            fill_in "email", with: "jonsong94@yahoo.com"
            fill_in "password", with: "angelica16"
            click_button "Submit"
            click_button 'Delete Account'
            expect(current_path).to eq('/users/new')
        end
    end
end