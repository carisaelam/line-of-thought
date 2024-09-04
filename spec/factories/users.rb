FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    full_name { Faker::Internet.name }
    password { Faker::Internet.password(min_length: 8) }
  end
end
