FactoryBot.define do
  factory :dish, class: Dish do
    name { Faker::TvShows::StrangerThings.unique.character }
    description { Faker::TvShows::StrangerThings.quote }
    chef
  end
end
