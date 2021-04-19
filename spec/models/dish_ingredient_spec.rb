require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  describe "relationships" do
    it {should belong_to :dish}
    it {should belong_to :ingredient}
  end

  describe 'class methods' do
    context '.chef_ingredients' do
      it 'returns a unique, ordered by calories desc, list of all a chefs ingredients' do
        chef = Chef.create!(name: "George")

        dish_1 = Dish.create!(name: "dish_1", description: 'this is dish 1', chef_id: chef.id)
        dish_2 = Dish.create!(name: "dish_2", description: 'this is dish 2', chef_id: chef.id)

        ingredient_1 = Ingredient.create!(name: "ingredient_1", calories: 10)
        ingredient_2 = Ingredient.create!(name: "ingredient_2", calories: 20)

        dish_1.ingredients << ingredient_1
        dish_1.ingredients << ingredient_2
        dish_2.ingredients << ingredient_1

        expect(DishIngredient.chef_ingredients(chef).count).to eq(2)
        expect(DishIngredient.chef_ingredients(chef).first.id ).to eq(ingredient_2.id)
      end
    end
  end
end
