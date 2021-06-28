require 'spec_helper'

feature 'User endorsements' do
  scenario 'a user shows when they do not have endorsements' do
    sign_up_jane

    first(:link, "View profile").click

    expect(page).to have_content "Jane"
    expect(page).not_to have_content "👍 0"
  end

  scenario 'a user can endorse another user with message' do
    sign_up_jane
    first(:link, "Logout").click
    sign_up_mark

    click_button "View Jane's Profile"

    fill_in "endorsement[body]", with: "I loved running with Jane"
    click_button "👍"

    expect(page).to have_content "Jane"
    expect(page).to have_content "Message this user"
    expect(page).to have_content "Mark 🗣 I loved running with Jane"
  end

  scenario 'a user can endorse another user without message' do
    sign_up_jane
    first(:link, "Logout").click
    sign_up_mark

    click_button "View Jane's Profile"

    click_button "👍"

    expect(page).to have_content "Jane"
    expect(page).to have_content "Message this user"
    expect(page).to have_content "👍 1"
    expect(page).not_to have_content "Mark 🗣"    
  end
end