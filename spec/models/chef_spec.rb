require 'rails_helper'

RSpec.describe Chef, type: :model do
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
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
end
