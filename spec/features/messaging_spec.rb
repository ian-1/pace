require 'rails_helper'

feature "Messages" do
  scenario "User without messages sees a no messages message" do
    sign_up_jane
    first(:link, "View inbox").click
    expect(page).to have_content "You do not have any conversations yet"
  end
  
  scenario "Once a user is signed up they can send and receive messages" do
    sign_up_jane
    first(:link, "Logout").click
    sign_up_mark

    click_button "View Jane's Profile"
    click_link "Message this user"
    fill_in "message[body]", with: "Hi Jane"
    click_button "Send message"
    first(:link, "Logout").click
    visit "/"
    click_link "Login"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    first(:link, "View inbox").click
    click_link "Mark"
    expect(page).to have_content "Hi Jane"
  end
end