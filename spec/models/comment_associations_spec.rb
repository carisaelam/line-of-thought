require 'rails_helper'

RSpec.describe 'Comment associations' do
  let(:user1) { FactoryBot.create(:user) }
  let (:user2) { FactoryBot.create(:user) }
  let (:post) { FactoryBot.create(:post, user: user1) }
  let (:comment) { FactoryBot.create(:comment, post: post, user: user2) }

  it 'Post has a comment' do
    expect(post.comments).to include(comment)
  end

  it 'User has a comment' do
    expect(user2.comments).to include(comment)
  end

  it 'Comment has one user' do
    expect(comment.user).to be(user2)
  end

  it 'Comment has one post' do
    expect(comment.post).to be(post)
  end
end
