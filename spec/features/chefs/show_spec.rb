require 'rails_helper'

RSpec.describe 'the chef show page' do
  before(:each) do
    @chef_1 = Chef.create!(name: "Emril")
    @chef_2 = Chef.create!(name: "Claudia")

    @dish_1 = @chef_1.dishes.create!(name: "Buritto", description: "Burrito with cheese and chili")
    @dish_2 = @chef_1.dishes.create!(name: "Nachos", description: "Nachos with chili and cheese")
    @dish_3 = @chef_2.dishes.create!(name: "Cheese Fries", description: "Fries with cheese")

    @ingredient_1 = Ingredient.create!(name: 'Tortilla', calories: 200)
    @ingredient_2 = Ingredient.create!(name: 'Cheese', calories: 100)
    @ingredient_3 = Ingredient.create!(name: 'Potato', calories: 300)
    @ingredient_4 = Ingredient.create!(name: 'Tortilla chips', calories: 250)
    @ingredient_5 = Ingredient.create!(name: 'Chili', calories: 400)

    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_5)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_4)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_2)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_3)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_2)
  end


  it 'us1 lists the chef' do
    visit "/chefs/#{@chef_1.id}"

      expect(page).to have_content(@chef_1.name)
  end

  it 'us1 lists all dishes and their descriptions for the chef' do
    visit "/chefs/#{@chef_1.id}"

      expect(page).to have_content("Dishes:")
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_2.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_content(@dish_2.description)
  end

  it 'us2 lists all ingredients and their calories the chef uses, listed from most to least calories and no duplicates' do
    visit "/chefs/#{@chef_1.id}"

      expect(page).to have_content("Chefs Ingredients:")
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_1.calories)
      expect(page).to have_content(@ingredient_2.calories)
  end

end
