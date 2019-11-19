require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      name: "Ninja",
      email: "ninja@email.com",
      password: 'amsneaky',
      password_confirmation: 'amsneaky'     
    )
  end
  scenario "Logs a user in" do
    visit '/login'
    fill_in 'email', with: 'ninja@email.com'
    fill_in 'password', with: 'amsneaky'
    click_on 'Submit'
    page.has_content?('Logout')
    # save_screenshot
  end
end