require 'rails_helper'

RSpec.describe 'Users can like posts' do
  user = FactoryBot.create(:user)
  post = FactoryBot.create(:post, user: user)

  scenario 'Liking posts' do
      sign_in_as(user)
      visit post_path(post)
      initial_like_total = post.likes.count
      puts initial_like_total

      click_on 'Like'

      expect(post.likes.count).to eql(initial_like_total + 1)
      puts post.likes.count
  end

  scenario 'Second user likes same post' do
      user2 = FactoryBot.create(:user)
      sign_in_as(user2)
      visit post_path(post)
      initial_like_total = post.likes.count
      puts initial_like_total

      click_on 'Like'

      expect(post.likes.count).to eql(initial_like_total + 1)
      puts post.likes.count
  end
end


RSpec.describe 'Users can unlike posts' do
  user = FactoryBot.create(:user)
  post = FactoryBot.create(:post, user: user)

  scenario 'Unlike posts' do
      sign_in_as(user)
      visit post_path(post)
      initial_like_total = post.likes.count
      puts initial_like_total
      click_on 'Like'
      click_on 'Unlike'

      expect(post.likes.count).to eql(initial_like_total)
      puts post.likes.count
  end
end

