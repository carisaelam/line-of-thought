require 'rails_helper'

RSpec.describe 'Like associations' do
  let (:user1) { FactoryBot.create(:user) }
  let (:user2) { FactoryBot.create(:user) }
  let (:post1) { FactoryBot.create(:post, user: user1) }
  let (:post2) { FactoryBot.create(:post, user: user2) }

  before do
    Like.create(user_id: user1.id, post_id: post2.id)
    Like.create(user_id: user2.id, post_id: post1.id)
  end

  it 'Post has a like' do
    expect(post1.likes.count).to eq(1)
  end

  it 'User has a like' do
    expect(user1.likes.count).to eq(1)
  end

  it 'User has a liked_post' do
    expect(user1.liked_posts).to include(post2)
  end
end
