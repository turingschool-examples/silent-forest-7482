require 'rails_helper'

RSpec.describe 'chef show page' do
  it 'has the name of the chef' do
    chef = Chef.create!(name: "Anthony")
    visit "/chefs/#{chef.id}"
    expect(page).to have_content("#{chef.name}")
  end
  it 'has the names and descriptions of all the chefs dishes' do
    chef = Chef.create!(name: "Anthony")
    dish1 = chef.dishes.create!(name: "Yum", description: "Very yum")
    dish2 = chef.dishes.create!(name: "Tasty", description: "Very tasty")

    visit "/chefs/#{chef.id}"
    
    within("#chef_dishes") do
      within("#dish-#{dish1.id}") do
        expect(page).to have_content("#{dish1.name}")
        expect(page).to have_content("#{dish1.description}")
      end

      within("#dish-#{dish2.id}") do
        expect(page).to have_content("#{dish2.name}")
        expect(page).to have_content("#{dish2.description}")
      end
    end
  end
end