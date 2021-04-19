require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    describe '.unique_ingredients_ordered_by_calories' do
      it 'can order all unique ingredients chef uses ordered from most to least calories' do
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
        DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
        DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_3)
        DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_4)

        expect(@chef.unique_ingredients_ordered_by_calories.first.name). to eq(@ingredient_4.name)
        expect(@chef.unique_ingredients_ordered_by_calories.last.name). to eq(@ingredient_1.name)
        expect(@chef.unique_ingredients_ordered_by_calories[1].calories). to eq(@ingredient_2.calories)
      end
    end
  end
end
