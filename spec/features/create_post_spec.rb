require 'rails_helper'

RSpec.describe 'Creating a post', type: :feature do
  scenario 'valid input' do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    visit new_post_path
    fill_in 'Body', with: 'This is the best first post ever'
    click_on 'Create Post'

    expect(page).to have_content('This is the best first post ever')
  end

  scenario 'blank input' do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    visit new_post_path
    click_on 'Create Post'

    expect(page).not_to have_content("Body can't be blank")
  end

  scenario 'too long input' do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    visit new_post_path
    fill_in "Body", with: "Despite the heavy rain, the determined hikers managed to reach the summit of the challenging mountain trail successfully."
    click_on 'Create Post'

    expect(page).to have_content("too long")
  end
end
