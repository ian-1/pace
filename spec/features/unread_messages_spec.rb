require 'rails_helper'

feature "Messages display unread message until read" do
  scenario "Sent messages show as unread messages until read" do

    sign_up_jane
    first(:link, "Logout").click
    sign_up_mark

    click_button "View Jane's Profile"
    click_link "Message this user"
    fill_in "message[body]", with: "Hi Jane"
    click_button "Send message"
    expect(page).to have_content "unread Mark at"
    first(:link, "Logout").click
    visit "/"
    click_link "Login"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    first(:link, "View inbox").click
    click_link "Mark"
    expect(page).to have_content "unread Mark at"
    first(:link, "View inbox").click
    click_link "Mark"
    expect(page).not_to have_content "unread"
  end

  scenario "User shown number of unread messages" do

    sign_up_jane
    first(:link, "Logout").click
    sign_up_mark
    click_button "View Jane's Profile"
    click_link "Message this user"
    fill_in "message[body]", with: "Hi Jane"
    click_button "Send message"
    fill_in "message[body]", with: "Hi again Jane"
    click_button "Send message"
    first(:link, "Logout").click

    visit "/"
    click_link "Login"
    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_content "View inbox (2)"
    first(:link, "View inbox (2)").click
    expect(page).to have_content "Mark (2)"
    click_link "Mark (2)"

    expect(page).not_to have_content "(0)"
  end
end