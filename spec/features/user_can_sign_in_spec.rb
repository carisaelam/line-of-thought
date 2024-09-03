require 'rails_helper'

RSpec.describe 'User Sign-In', type: :feature do
  scenario 'with valid credentials' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end
