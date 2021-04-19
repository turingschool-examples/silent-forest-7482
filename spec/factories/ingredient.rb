FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }
    calories { Faker::Number.between(from: 1, to: 500) }
  end
end
