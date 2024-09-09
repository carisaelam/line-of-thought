require 'rails_helper'

RSpec.describe 'Users can follow other users' do
  Faker::UniqueGenerator.clear
  user1 = FactoryBot.create(:user)
  user2 = FactoryBot.create(:user)

  before do
    user1.followees << user2
  end

  scenario 'User1 is following User2' do
      sign_in_as(user1)
      visit followees_path(user1)

      puts "user1 email: #{user1.email}"

      puts "user1 full_name: #{user1.full_name}"
      puts "user2 full_name: #{user2.full_name}"

      expect(page).to have_content(user2.full_name)
  end
end
