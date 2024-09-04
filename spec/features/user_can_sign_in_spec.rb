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
require 'rails_helper'

RSpec.describe 'Can identify user posts' do
  user1 = FactoryBot.create(:user)
  user2 = FactoryBot.create(:user)
  first_post = FactoryBot.create(:post, user: user1)

  scenario 'User has many posts' do
    expect(user1.posts).to include(first_post)
  end

  scenario 'User has no posts' do
    expect(user2.posts).to be_empty
  end

  scenario 'Post has one user' do
    expect(first_post.user).to be(user1)
  end
end
