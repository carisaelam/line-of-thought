require 'faker'

# Clear existing data
User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

example_user_email = 'example@example.com'
example_user_password = 'password'
example_user_full_name = 'Example User'

unless User.exists?(email: example_user_email)
  User.create!(
    email: example_user_email,
    full_name: example_user_full_name,
    password: example_user_password,
    password_confirmation: example_user_password
  )
  puts "Created example user: #{example_user_email}"
else
  puts "Example user already exists: #{example_user_email}"
end


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
  user_id = User.pluck(:id).sample
  post_id = Post.pluck(:id).sample

  Like.find_or_create_by(
    user_id: user_id,
    post_id: post_id
  )
end
