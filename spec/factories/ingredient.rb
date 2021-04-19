FactoryBot.define do
  factory :ingrdient do
    name { Faker::Food.ingredient }
    calories { Faker::Number.between(from: 1, to: 500) }
  end
end
