FactoryBot.define do
   factory :chef, class: Chef do
      name { Faker::Sports::Basketball.unique.player }
   end
 end
