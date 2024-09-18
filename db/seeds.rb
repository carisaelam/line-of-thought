require 'faker'

# Clear existing data
User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

# Create users with unique emails
(1..50).each do
  email = Faker::Internet.unique.email
  puts "Attempting to create user with email: #{email}"
  begin
    user = User.create!(
      email: email,
      full_name: Faker::Name.unique.name,
      password: 'password',
      password_confirmation: 'password'
    )
    puts "Created user: #{user.email}"
  rescue ActiveRecord::RecordInvalid => e
    puts "Failed to create user with email #{email}: #{e.message}"
  end
end

# Create posts
(1..30).each do
  Post.create!(
    user_id: User.pluck(:id).sample,
    body: Faker::Hipster.sentence(word_count: rand(3..6)),
  )
end

# Create comments
(30..80).each do
  Comment.create!(
    user_id: User.pluck(:id).sample,
    post_id: Post.pluck(:id).sample,
    body: Faker::Company.catch_phrase
  )
end

# Create likes
(1..50).each do
  Like.create!(
    user_id: User.pluck(:id).sample,
    post_id: Post.pluck(:id).sample
  )
end
