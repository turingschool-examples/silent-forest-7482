FactoryBot.define do
  factory :ingredient, class: Ingredient do
    name { Faker::TvShows::Suits.unique.character }
    calories { Faker::Number.between(from: 15, to: 5000) }
    dish
  end
end
