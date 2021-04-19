require 'rails_helper'

RSpec.describe "when i visit a chef show page" do

  it "i see a list of that chef's name" do
    chef_a = Chef.create!(name: "albert")
    chef_b = Chef.create!(name: "bob")

    dish_1 = chef_a.dishes.create!(name: "a1 barbique", description: "hot and spicy")
    dish_2 = chef_a.dishes.create!(name: "abc soop", description: "words words words")
    dish_3 = chef_b.dishes.create!(name: "bee honey tea", description: "fancy stuff")
    dish_4 = chef_b.dishes.create!(name: "beverage supprize", description: "it's a supprize")

    water = Ingredient.create!(name: "water", calories: 0)
    spicy = Ingredient.create!(name: "spicy", calories: 5)
    sweet = Ingredient.create!(name: "sweet", calories: 20)
    secret = Ingredient.create!(name: "secret", calories: 10)

    dish_ingredient_1a = DishIngredient.create!(ingredient: spicy, dish: dish_1 )
    dish_ingredient_1b = DishIngredient.create!(ingredient: sweet, dish: dish_1 )
    dish_ingredient_2a = DishIngredient.create!(ingredient: secret, dish: dish_2 )
    dish_ingredient_2b = DishIngredient.create!(ingredient: water, dish: dish_2 )
    dish_ingredient_3a = DishIngredient.create!(ingredient: water, dish: dish_3 )
    dish_ingredient_3b = DishIngredient.create!(ingredient: sweet, dish: dish_3 )
    dish_ingredient_4a = DishIngredient.create!(ingredient: secret, dish: dish_4 )
    dish_ingredient_4b = DishIngredient.create!(ingredient: spicy, dish: dish_4 )

    visit "/chefs/#{chef_a.id}"

    expect(page).to have_content("#{chef_a.name}")
  end

  describe "i see a list of that chef's dishes" do
    it ": they have names" do
      chef_a = Chef.create!(name: "albert")
      chef_b = Chef.create!(name: "bob")

      dish_1 = chef_a.dishes.create!(name: "a1 barbique", description: "hot and spicy")
      dish_2 = chef_a.dishes.create!(name: "abc soop", description: "words words words")
      dish_3 = chef_b.dishes.create!(name: "bee honey tea", description: "fancy stuff")
      dish_4 = chef_b.dishes.create!(name: "beverage supprize", description: "it's a supprize")

      visit "/chefs/#{chef_a.id}"

      expect(page).to have_content("#{dish_1.name}")
      expect(page).to have_content("#{dish_2.name}")
    end

    it ": they have descriptions" do
      chef_a = Chef.create!(name: "albert")
      chef_b = Chef.create!(name: "bob")

      dish_1 = chef_a.dishes.create!(name: "a1 barbique", description: "hot and spicy")
      dish_2 = chef_a.dishes.create!(name: "abc soop", description: "words words words")
      dish_3 = chef_b.dishes.create!(name: "bee honey tea", description: "fancy stuff")
      dish_4 = chef_b.dishes.create!(name: "beverage supprize", description: "it's a supprize")

      visit "/chefs/#{chef_a.id}"

      expect(page).to have_content("#{dish_1.description}")
      expect(page).to have_content("#{dish_2.description}")
    end
  end

  # it "i see a list of that chef's ingredients" do
  #
  #   visit "/chefs/#{chef_a.id}"
  #
  # end


end
