require 'rails_helper'

feature "Profile page show" do
  scenario "Users can view other users profiles" do

    sign_up_jane
    
    first(:link, "View profile").click
    expect(page).to have_content "Jane"
    expect(page).to have_content "SW1"
    expect(page).to have_content "Female"
    expect(page).to have_content "Couch"
    expect(page).to have_content "Speed"
    expect(page).to have_content "jdoe@email.com"
  end
end
