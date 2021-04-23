require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  before(:each) do
		@chef = Chef.create!(name: "Joey")
		@dish_1 = @chef.dishes.create!(name: "mac & cheese", description: "super cheesy")
    @dish_2 = @chef.dishes.create!(name: "ramen", description: "extra spicy")
		@dish_3 = @chef.dishes.create!(name: "pizza", description: "deep dish")
		@ingredient_1 = Ingredient.create!(name: "cheese", calories: 100)
		@ingredient_2 = Ingredient.create!(name: "salt", calories: 0)
		@ingredient_3 = Ingredient.create!(name: "veggie broth", calories: 80)
		@ingredient_4 = Ingredient.create!(name: "eggs", calories: 150)
		@ingredient_5 = Ingredient.create!(name: "noodles", calories: 300)
		@ingredient_6 = Ingredient.create!(name: "flour", calories: 105)
		@dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
		@dish_ingredient_2 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_5)
		@dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_2)
		@dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5)
		@dish_ingredient_1 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_1)
		@dish_ingredient_1 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_6)
	end

  describe "relationships" do
    it {should have_many :dish_ingredients}
    it {should have_many(:dishes).through(:dish_ingredients)}
  end

  describe "class methods" do
    it 'returns ingredients for a chef and orders by calories' do

      expect(Ingredient.ingredients_included_by_cal(@chef.id)).to eq([@ingredient_5,@ingredient_6,@ingredient_1,@ingredient_2])
    end
  end
end
