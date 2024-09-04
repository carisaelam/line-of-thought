require 'rails_helper'

RSpec.describe 'User-post associations' do
  let(:user1) { FactoryBot.create(:user) }
  let (:user2) { FactoryBot.create(:user) }
  let (:first_post) { FactoryBot.create(:post, user: user1) }

  it 'User has many posts' do
    expect(user1.posts).to include(first_post)
  end

  it 'User has no posts' do
    expect(user2.posts).to be_empty
  end

  it 'Post has one user' do
    expect(first_post.user).to be(user1)
  end
end
