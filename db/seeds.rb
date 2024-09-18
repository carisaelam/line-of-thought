require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

(1..50).each do
  email = Faker::Internet.unique.email
  puts "Attempting to create user with email: #{email}"
  unless User.exists?(email: email)
    user = User.create!(
      email: email,
      full_name: Faker::Name.unique.name,
      password: 'password',
      password_confirmation: 'password'
    )
    puts "Created user: #{user.email}"
  else
    puts "User with email #{email} already exists."
  end
end

(1..30).each do |id|
  Post.create!(
    user_id: User.pluck(:id).sample,
    body: Faker::Hipster.sentence(word_count: rand(5-10)),
  )
end

(30..80).each do |id|
  Comment.create!(
    user_id: User.pluck(:id).sample,
    post_id: Post.pluck(:id).sample,
    body: Faker::Company.catch_phrase
  )
end

(1..50).each do |id|
  Like.create!(
    user_id: User.pluck(:id).sample,
    post_id: Post.pluck(:id).sample
  )
end
