require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "chef_ingredients : " do
    it "lists ingredients belonging to a specific chef's dishes" do
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
      dish_ingredient_4a = DishIngredient.create!(ingredient: water, dish: dish_4 )
      dish_ingredient_4b = DishIngredient.create!(ingredient: spicy, dish: dish_4 )

      expectation = [water, spicy, sweet]

      expect(chef_b.chef_ingredients).to eq(expectation)
    end

    it "ingredients are orded by callory count" do
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
      dish_ingredient_4a = DishIngredient.create!(ingredient: water, dish: dish_4 )
      dish_ingredient_4b = DishIngredient.create!(ingredient: spicy, dish: dish_4 )

      expectation = [water, spicy, sweet]

      expect(chef_b.chef_ingredients).to eq(expectation)
    end

    it "there are no duplicate ingredients" do
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
      dish_ingredient_4a = DishIngredient.create!(ingredient: water, dish: dish_4 )
      dish_ingredient_4b = DishIngredient.create!(ingredient: spicy, dish: dish_4 )

      expectation = [water, spicy, sweet]

      expect(chef_b.chef_ingredients).to eq(expectation)

    end
  end

end
