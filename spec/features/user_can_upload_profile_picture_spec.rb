require 'spec_helper'

feature 'profile picture' do
  scenario 'at signup, user can upload an image & see it on user feed' do

    sign_up_jane
    expect(page).to have_xpath("//img[contains(@src,'miss_piggy.jpg')]")
  end

  scenario 'at signup, user can upload an image & see it on profile page' do
    sign_up_mark
    first(:link, "View profile").click
    expect(page).to have_xpath("//img[contains(@src,'miss_piggy.jpg')]")
  end
end
