require 'rails_helper'
feature "logged in user creates a message" do
    before (:each) do
        visit "/users/new"
        fill_in "user_username", with: "jonsong94"
        click_button "Create User"
    end
    scenario "successfully creates a new message" do
        visit ('/messages/1')
        fill_in "message_message", with: "Hi my name is jonathon song"
        click_button "Create Message"
        expect(page).to have_content "Message successfully created"
    end
end
feature "logged in user cannot create a message" do
    before (:each) do
        visit "/users/new"
        fill_in "user_username", with: "jonsong94"
        click_button "Create User"
    end
    scenario "cannot create message" do
        visit ('/messages/1')
        fill_in "message_message", with: "Hello"
        click_button "Create Message"
        expect(page).to have_content "Message is too short (minimum is 10 characters)"
    end
end