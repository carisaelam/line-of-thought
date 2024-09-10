require 'rails_helper'

RSpec.describe 'Following' do
  user1 = FactoryBot.create(:user)
  user2 = FactoryBot.create(:user)
  user3 = FactoryBot.create(:user)
  user4 = FactoryBot.create(:user)
  before do
    user3.follow(user4)
  end

  scenario 'User can follow another user' do
      sign_in_as(user1)
      visit user_path(user2)

      click_on 'Follow'

      expect(user2.followers).to include(user1)
  end

  scenario 'User can unfollow another user' do
      sign_in_as(user3)
      visit user_path(user4)

      click_on 'Unfollow'

      expect(user4.followers).not_to include(user3)
  end

  scenario 'User cannot follow themselves' do
    sign_in_as(user1)
    visit user_path(user1)

    expect(page).not_to have_button("Follow")
  end
end
