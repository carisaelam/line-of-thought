require 'rails_helper'

RSpec.describe 'Following' do
  user1 = FactoryBot.create(:user)
  user2 = FactoryBot.create(:user)

  scenario 'User can follow another user' do
      sign_in_as(user1)
      visit user_path(user2)

      click_on 'Follow'

      expect(user2.followers).to include(user1)
  end

  scenario 'User can unfollow another user' do
      sign_in_as(user1)
      visit user_path(user2)
      click_on 'Follow' # to trigger a follow event and change the button
      click_on 'Unfollow'

      expect(user2.followers).not_to include(user1)
  end

  scenario 'User cannot follow themselves' do
    sign_in_as(user1)
    visit user_path(user1)

    expect(page).not_to have_button("Follow")
  end
end
