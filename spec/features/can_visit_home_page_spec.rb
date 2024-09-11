require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  scenario 'can visit the home page' do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    visit root_path
    expect(page).to have_content('All Posts')
  end
end
