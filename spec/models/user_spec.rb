require 'rails_helper'

RSpec.describe 'Follow method' do
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }

  it 'allows user to follow another user' do
    user1.follow(user2)

    expect(user1.followees).to include(user2)
  end
end


RSpec.describe 'Unfollow method' do
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }

  it 'allows user to unfollow another user' do
    user1.unfollow(user2)

    expect(user1.followees).not_to include(user2)
  end
end
