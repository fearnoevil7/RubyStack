require 'rails_helper'
feature "has a logout and can logout" do
    before (:each) do
        visit "users/new"
        fill_in "user_username", with: "jonsong94"
        click_button "Create User"
    end
    scenario "is there a logout link" do
        visit ('/messages/1')
        page.has_content?('Logout')
        expect(page).to have_link "Logout", href: "/logout"
    end
    scenario "can successfully logout" do
        visit ('/messages/1')
        click_link ('Logout')
        expect(page).to have_current_path "/users/new"
    end
end
