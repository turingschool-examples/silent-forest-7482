require 'rails_helper'

RSpec.describe 'chef show page', type: :feature do
  before :each do
    @chef = Chef.create!(name: 'Gordan Ramsay')
    @dish_1 = @chef.dishes.create!(name: 'Spaghetti', description: 'delicious pasta')
    @dish_2 = @chef.dishes.create!(name: 'Margarita Pizza', description: 'I love pizza')
    @dish_3 = @chef.dishes.create!(name: 'Fish Taco', description: 'Taco Tuesday')
    @ingredient_1 = Ingredient.create!(name: 'tomato sauce', calories: 50)
    @ingredient_2 = Ingredient.create!(name: 'pasta', calories: 300)
    @ingredient_3 = Ingredient.create!(name: 'cheese', calories: 200)
    @ingredient_4 = Ingredient.create!(name: 'fish', calories: 350)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
    DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_3)
    DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_4)
    visit chef_path(@chef.id)
  end

  it 'can see the name of the chef' do
    expect(page).to have_content(@chef.name)
  end

  it 'can see the nams and descriptions of all dishes' do
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)

    expect(page).to have_content(@dish_2.name)
    expect(page).to have_content(@dish_2.description)

    expect(page).to have_content(@dish_3.name)
    expect(page).to have_content(@dish_3.description)
  end

  it 'can see all unique ingredients for all dishes the chef makes ordered from most to least calories' do
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_1.calories)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_2.calories)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to have_content(@ingredient_3.calories)
    expect(page).to have_content(@ingredient_4.name)
    expect(page).to have_content(@ingredient_4.calories)

    expect(@ingredient_3.name).to appear_before(@ingredient_1.name)
    expect(@ingredient_4.name).to appear_before(@ingredient_1.name)
    expect(@ingredient_4.name).to appear_before(@ingredient_3.name)
  end

  it 'can see button to delete dish and clicking button deletes dish from chefs dishes' do
    expect(page).to have_content(@dish_1.name)

    within("#dish-#{@dish_1.id}") do
      click_button 'Delete Dish'
    end

    expect(page).not_to have_content(@dish_1.name)
  end

  # it 'can show 3 most popular ingredients for the chef' do
  #   @ingredient_5 = Ingredient.create!(name: 'basil', calories: 5)
  #   DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_5)
  #   DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5)
  #   DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_5)
  #
  #   within(".most-popular-ingredients") do
  #     expect(page).to have_content(@ingredient_5.name)
  #     expect(page).to have_content(@ingredient_1.name)
  #     expect(page).to have_content(@ingredient_3.name)
  #     expect(page).not_to have_content(@ingredient_2.name)
  #     expect(page).not_to have_content(@ingredient_4.name)
  #   end
  # end
end
