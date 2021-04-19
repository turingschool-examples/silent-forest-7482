require 'rails_helper'

RSpec.describe Chef, type: :model do
  before(:each) do
    @chef_1 = Chef.create!(name: "Iron Wokman")

    @dish_1 = @chef_1.dishes.create!(name: "Dish_1", description: "Tasty")
    @dish_2 = @chef_1.dishes.create!(name: "Dish_2", description: "Spicy")

    @ingredient_1 = Ingredient.create!(name: "Ingredient_1", calories: 10)
    @ingredient_2 = Ingredient.create!(name: "Ingredient_2", calories: 20)
    @ingredient_3 = Ingredient.create!(name: "Ingredient_3", calories: 15)

    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)

    DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_2.id)
    DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_3.id)
  end

  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it "#uniq_ingredients_calories_descending" do
      expected = [@ingredient_2, @ingredient_3, @ingredient_1]

      expect(@chef_1.uniq_ingredients_calories_descending.first.name).to eq(@ingredient_2.name)
      expect(@chef_1.uniq_ingredients_calories_descending.last.name).to eq(@ingredient_1.name)
    end
  end
end
