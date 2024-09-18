require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

(1..50).each do |id|
  email = Faker::Internet.unique.email
  puts "Attempting to create user with email: #{email}"
  User.find_or_create_by!(email: email) do |user|
    user.full_name = Faker::Name.unique.name
    user.password = 'password' # Devise will encrypt this
    user.password_confirmation = 'password'
    puts "Created user: #{user.email}"
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
