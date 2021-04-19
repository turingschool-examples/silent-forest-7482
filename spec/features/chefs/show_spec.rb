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
  
  it 'has a list of all ingredients with calories, no duplicates' do
    chef = Chef.create!(name: "Anthony")
    dish1 = chef.dishes.create!(name: "Yum", description: "Very yum")
    dish2 = chef.dishes.create!(name: "Tasty", description: "Very tasty")
    ingredient2 = dish1.ingredients.create!(name: "carrot", calories: 20)
    ingredient6 = dish2.ingredients.create!(name: "onion", calories: 10)
    ingredient1 = dish1.ingredients.create!(name: "onion", calories: 10)
    ingredient5 = dish2.ingredients.create!(name: "butter", calories: 50)
    ingredient4 = dish2.ingredients.create!(name: "garlic", calories: 40)
    ingredient3 = dish1.ingredients.create!(name: "potato", calories: 30)

    visit "/chefs/#{chef.id}"    
    save_and_open_page
    within("#chef_ingredients") do
        expect(page).to have_content(ingredient1.name.capitalize)
        expect(page).to have_content(ingredient1.calories)

        expect(page).to have_content(ingredient2.calories)

        expect(page).to have_content(ingredient3.name.capitalize)
        expect(page).to have_content(ingredient3.calories)

        expect(page).to have_content(ingredient4.name.capitalize)
        expect(page).to have_content(ingredient4.calories)

        expect(page).to have_content(ingredient5.name.capitalize)
        expect(page).to have_content(ingredient5.calories)

        expect(page).to have_content(ingredient6.name.capitalize)
        expect(page).to have_content(ingredient6.calories)
    end
  end
  it 'has ordered the list of ingredients from most calories to least'
end