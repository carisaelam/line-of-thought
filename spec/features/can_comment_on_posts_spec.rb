require 'rails_helper'

RSpec.describe 'Users can comment on posts' do
  scenario 'Commenting on posts' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      post1 = FactoryBot.create(:post, user: user1)
      sign_in_as(user2)
      visit post_path(post1)
      fill_in 'Body', with: 'Helpful comment'
      click_on 'Add Comment'

      expect(page).to have_content('Helpful comment')
  end
end
