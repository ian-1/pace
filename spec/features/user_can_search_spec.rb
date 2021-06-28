require 'rails_helper'

feature "User can search for other users" do
  scenario "Once a user is signed up they can search for other users by username" do
    sign_up_jane
    first(:link, "Logout").click
    sign_up_mark

    fill_in "q", with: "Jane"
    click_button("🔍")
    expect(page).not_to have_content "Mark"
  end
  
  scenario "Once a user is signed up they can search for other users by category" do
    sign_up_jane
    first(:link, "Logout").click
    sign_up_mark
  
    fill_in "q", with: "Marathon"
    click_button("🔍")
    expect(page).not_to have_content "Couch"
  end
end
