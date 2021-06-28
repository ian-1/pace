feature "View your profile button" do
  scenario "User can see a view your profile button" do
    sign_up_jane
    click_button "View Your Profile"
    expect(page).to have_content "jdoe@email.com"
    expect(page).to have_link "Edit"
  end
end