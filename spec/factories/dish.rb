FactoryBot.define do
  factory :dish, class: Dish do
    name { Faker::TvShows::StrangerThings.unique.character }
    description { Faker::TvShows::StrangerThings.unique.quote }
    chef
  end
end
