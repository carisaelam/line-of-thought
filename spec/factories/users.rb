FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    full_name { Faker::Name.unique.name }
    password { Faker::Internet.password(min_length: 8) }
  end
end
