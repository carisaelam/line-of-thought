require 'faker'

(1..50).each do |id|
  User.find_or_create_by!(
    full_name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
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
