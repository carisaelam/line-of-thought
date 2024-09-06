require 'faker'

(1..40).each do |id|
  User.create!(
    full_name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

(1..30).each do |id|
  Post.create!(
    user_id: User.pluck(:id).sample,
    body: Faker::Company.catch_phrase
  )
end

(1..50).each do |id|
  Comment.create!(
    user_id: User.pluck(:id).sample,
    post_id: Post.pluck(:id).sample,
    body: Faker::Company.catch_phrase
  )
end
