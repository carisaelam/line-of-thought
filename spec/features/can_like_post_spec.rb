require 'rails_helper'

RSpec.describe 'Users can like posts' do
  scenario 'Liking posts' do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user: user)
      sign_in_as(user)
      visit post_path(post)
      initial_like_total = post.likes.count
      puts initial_like_total

      click_on 'Like'

      expect(post.likes.count).to eql(initial_like_total + 1)
      puts post.likes.count
  end
end
