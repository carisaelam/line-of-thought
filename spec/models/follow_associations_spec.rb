require 'rails_helper'

RSpec.describe 'Follow associations' do
  let(:user1) { FactoryBot.create(:user) }
  let (:user2) { FactoryBot.create(:user) }

  before do
    user1.followees << user2
  end

  it 'User1 follows User2' do
    expect(user1.followees).to include(user2)
  end

  it 'User2 is followed by User1' do
    expect(user2.followers).to include(user1)
  end
end
