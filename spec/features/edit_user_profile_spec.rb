require 'rails_helper'

feature "Edit button" do
  scenario "User can see an edit button" do
    sign_up_jane
    first(:link, "View profile").click
    expect(page).to have_content "jdoe@email.com"
    expect(page).to have_link "Edit"
  end

  scenario "Other users cannot see edit button on other profiles" do
    sign_up_jane
    first(:link, "Logout").click
    sign_up_mark
    click_button "View Jane's Profile"
    expect(page).not_to have_link "Edit"
  end
end
