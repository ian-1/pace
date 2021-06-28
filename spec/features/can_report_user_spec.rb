require 'rails_helper'

feature "Users can report each other" do
  scenario "Once a user is signed up they can report another user" do
    sign_up_jane
    first(:link, "Logout").click

    sign_up_mark

    click_button "View Jane's Profile"
    click_link "Report this user"

    expect(page).to have_content "Report a user"

    fill_in "report[body]", with: "Reason for report"
    click_button "Confirm report"

    expect(page).to have_content "Jane"
    expect(page).to have_content "Message this user"
    expect(page).to have_content "You have reported this user! Our admin team is looking into this."
  end
end
