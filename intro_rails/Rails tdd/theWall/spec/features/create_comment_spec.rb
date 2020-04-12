require 'rails_helper'
feature "logged in user can create a comment" do
    before (:each) do
        visit "/users/new"
        fill_in "user_username", with: "jonsong94"
        click_button "Create User"
        visit('/messages/1')
        fill_in "message_message", with: "Hi my name is jonathon song"
        click_button "Create Message"
    end
    scenario "successfully creates a new comment" do
        # before (:each) do
        #     # visit('/messages/1')
        #     # fill_in "message_message", with: "Hi my name is jonathon song"
        #     # click_button "Create Message"
        # end
        visit ('/messages/1')
        fill_in "comment_comment", with: "Well hello there!!!!!!!"
        click_button "Post a Comment"
        expect(page).to have_content "Comment successfully created"
    end
end
feature "logged in user cannot create a comment" do
    before (:each) do
        visit "/users/new"
        fill_in "user_username", with: "jonsong94"
        click_button "Create User"
        visit('/messages/1')
        fill_in "message_message", with: "Hi my name is jonathon song"
        click_button "Create Message"
    end
    scenario "cannot create a comment" do
        visit ('/messages/1')
        fill_in 'comment_comment', with: "Hello"
        click_button "Post a Comment"
        expect(page).to have_content "cannot create comment"
    end
end