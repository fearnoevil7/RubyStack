require 'rails_helper'
feature "guest user creates an account and logs in" do
    scenario "successfully creates a new user account" do
        visit "users/new"
        fill_in "user_username", with: "fearnoevil7"
        click_button "Create User"
        expect(page).to have_content "User successfully created"
        expect(page).to have_current_path "/messages/1"
    end
    scenario "successfully logged in" do
        user = User.create(username:"fearnoevil7")
        visit "users/new"
        fill_in "user_username", with: "fearnoevil7"
        click_button "Create User"
        expect(page).to have_content "User successfully logged in"
        expect(page).to have_current_path "/messages/1"
    end
end
feature "guest user cannot login or enroll because of invalid inputs" do
    scenario "cannot create account or login because of invalid inputs" do
        visit "/users/new"
        fill_in "user_username", with: "love"
        click_button "Create User"
        # expect(page).to have_content "Cannot create user... username invalid"
        expect(page).to have_current_path "/users/new"
    end
end