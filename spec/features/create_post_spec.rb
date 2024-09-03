require 'rails_helper'

RSpec.describe 'Creating a post', type: :feature do
  scenario 'valid inputs' do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    visit new_post_path
    fill_in 'Body', with: 'This is the best first post ever'
    click_on 'Create Post'


    expect(page).to have_content('This is the best first post ever')
  end
end
