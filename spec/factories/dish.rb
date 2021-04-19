FactoryBot.define do
  factory :dish do
    name { Faker::Name.name }
    description { Faker::Food.description }
  end
end
