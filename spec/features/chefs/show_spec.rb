require 'rails_helper'

RSpec.describe 'the chef show' do
  before (:each)do
  @chef_1 = Chef.create!(name: "Pat Smith")
  @chef_2 = Chef.create!(name: "Jill Jones")

  @dish_1 = @chef_1.dishs.create!(name: "Coucous", description: "Healthy grain")
  @dish_2 = @chef_1.dishs.create!(name: "Farm Lamb", description: "Savory protein")

  @salt = Ingredient.create!(name: "Salt", calories: 3)
  @butter = Ingredient.create!(name: "Butter", calories: 102)
  @oil = Ingredient.create!(name: "Olive Oil", calories: 250)
  @grain = Ingredient.create!(name: "Grain", calories: 37)

  @coucous.ingredients < @butter
  @coucous.ingredients < @salt
  @coucous.ingredients < @grain

  @lamb.ingredients < @oil
  @lamb.ingredients < @butter

  DishIngredient.create!(dish: @pilaf, ingredient: @grain)
  DishIngredient.create!(dish: @pilaf, ingredient: @oil)

  DishIngredient.create!(dish: @crispy, ingredient: @oil)
  DishIngredient.create!(dish: @crispy, ingredient: @butter)
  end

  it "shows the chef name" do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content(@chef_1.name)
  end

  it "shows names & descriptions of all the chefs dishes" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content(@dish_2.name)
    expect(page).to have_content(@dish_2.description)
  end

  it "shows name & calories of all ingredients in their dishes" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content(@dish_2.name)
    expect(page).to have_content(@dish_2.description)
  end

  it "shows list of ingredients, unique" do
    visit "/chefs/#{@chef.id}"

    # expect(page).to have_content()
  end

  it "shows list of ingredients, ordered from most calories to least" do
    visit "/chefs/#{@chef.id}"

    # expect(page).to have_content()
  end


  it "has button to delete a dish" do
    visit "/chefs/#{@chef.id}"

    click_on("Delete #{@dish_1.name}")

    expect(page).to have_current_path('/chefs')
    expect(page).to_not have_content(@dish_1.name)
  end
end
