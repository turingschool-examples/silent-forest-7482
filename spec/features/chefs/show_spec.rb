require 'rails_helper'

describe 'chef show page' do
  before(:each) do
    @chef_1 = create(:chef)
    @chefs_dishe = create(:dish, chef: @chef_1)

    @chef_2 = create(:chef)
    @chefs_dish_2 = create(:dish, chef: @chef_2)
    @ingredients_1 = create_list(:ingredient, calories: 100)
    @ingredients_2 = create_list(:ingredient, calories: 25)
    @dish_ingredients_1 = create(:dish_ingredient, dish: @chefs_dish_2, ingredient: @ingredients_1)
    @dish_ingredients_2 = create(:dish_ingredient, dish: @chefs_dish_2, ingredient: @ingredients_2)
  end

  it "shows name of chef" do
    visit "/chefs/:id"

    expect(page).to have_content(@chef_1.name)
  end

  it "shows names and descriptions of all the chef's dishes" do
    visit "/chefs/:id"

    expect(page).to have_content(@chefs_dishes.name)
    expect(page).to have_content(@chefs_dishes.description)
  end

  it "shows name and calories of all ingredients this chef uses in their dishes" do
    visit "/chefs/:id"

    expect(page).to have_content(@dish_ingredients_1.ingredient.name)
    expect(page).to have_content(@dish_ingredients_1.ingredient.calories)
  end

  it "shows list of ingredients is ordered from most calories to least calories" do
    visit "/chefs/:id"

    expect(page.all('.ingredients')[0]).to have_content(@dish_ingredients_1.ingredient.calories)
    expect(page.all('.ingredients')[1]).to have_content(@dish_ingredients_2.ingredient.calories)
  end

  it "shows a delete button next to each dish" do
    visit "/chefs/:id"

    click_button "delete"

    expect(page).to have_button("delete")
    expect(current_path).to have_link("/chefs/:id")
  end

end
