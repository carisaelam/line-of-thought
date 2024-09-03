FactoryBot.define do
  factory :post do
    body { Faker::Science.scientist[0, 100] }
  end
end
