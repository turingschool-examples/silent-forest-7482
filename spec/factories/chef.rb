FactoryBot.define do
   factory :chef, class: Chef do
      name { Faker::Sports::Basketball.player }
   end
 end
