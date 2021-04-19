require 'rails_helper'

RSpec.describe 'the chefs show page' do
  before(:each) do
    @chef_1 = Chef.create!(name: "Amy")
    @dish_1 = @chef_1.dishes.create!(name: "Alfredo", description: "Creamy Pasta")
    @dish_2 = @chef_1.dishes.create!(name: "Carrot Pie", description: "Pup fav")
    @ing_1 = Ingredient.create!(name: "carrots", calories: 100)
    @ing_2 = Ingredient.create!(name: "milk", calories: 200)
    @ing_3 = Ingredient.create!(name: "cheese", calories: 300)
    Recipe.create!(dish: @dish_1, ingredient: @ing_1)
    Recipe.create!(dish: @dish_1, ingredient: @ing_2)
    Recipe.create!(dish: @dish_2, ingredient: @ing_3)

    @chef_2 = Chef.create!(name: "Bob")
    @bob_dish = @chef_2.dishes.create!(name: "Bob's dish", description: "Bobs fav")
  end

  it 'displays the name and description of all the chef dishes' do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content(@chef_1.name)
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to_not have_content(@chef_2.name)
    expect(page).to_not have_content(@bob_dish.description)
  end

  it 'displays a list of ingredients used in dishes from most calories to least' do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content(@chef_1.ingredient_calories_list)
    expect(page).to have_content(@ing_1.name)
    expect(page).to have_content(@ing_1.calories)
    expect(page).to have_content(@ing_2.name)
    expect(page).to have_content(@ing_2.calories)
    expect(page).to have_content(@ing_3.name)
    expect(page).to have_content(@ing_3.calories)
  end
end
