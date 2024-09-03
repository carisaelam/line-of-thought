require 'rails_helper'

RSpec.describe 'Post displays username', type: :feature do
  scenario 'valid post' do
    user = FactoryBot.create(:user)
    puts user
    puts user.username
    sign_in_as(user)
    post = FactoryBot.create(:post, user: user)
    visit new_post_path
    fill_in 'Body', with: post.body
    click_on 'Create Post'
    visit post_path(post)

    expect(page).to have_content(user.username)
  end
end
