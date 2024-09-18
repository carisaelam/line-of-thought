require 'rails_helper'

RSpec.describe 'Updating a post', type: :feature do
  scenario 'Updating with valid input' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user)
    sign_in_as(user)
    visit post_path(post)
    click_on 'Edit this post'
    fill_in 'Body', with: 'This is an edit of an original post'
    click_on 'Update Post'

    expect(page).to have_content('This is an edit of an original post')
  end

  scenario 'Updating with invalid input' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user)
    sign_in_as(user)
    visit post_path(post)
    click_on 'Edit this post'
    fill_in 'Body', with: 'Despite the heavy rain, the determined hikers managed to reach the summit of the challenging mountain trail successfully.'
    click_on 'Update Post'

    expect(page).to have_content('too long')
  end
end
