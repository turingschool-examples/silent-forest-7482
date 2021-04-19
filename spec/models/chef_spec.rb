require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  before(:each) do
    @chef_1 = Chef.create!(name: "Emril")
    @chef_2 = Chef.create!(name: "Claudia")

    @dish_1 = @chef_1.dishes.create!(name: "Buritto", description: "Burrito with cheese and chili")
    @dish_2 = @chef_1.dishes.create!(name: "Nachos", description: "Nachos with chili and cheese")
    @dish_3 = @chef_2.dishes.create!(name: "Cheese Fries", description: "Fries with cheese")

    @ingredient_1 = Ingredient.create!(name: 'Tortilla', calories: 200)
    @ingredient_2 = Ingredient.create!(name: 'Cheese', calories: 100)
    @ingredient_3 = Ingredient.create!(name: 'Potato', calories: 300)
    @ingredient_4 = Ingredient.create!(name: 'Tortilla chips', calories: 250)
    @ingredient_5 = Ingredient.create!(name: 'Chili', calories: 400)

    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_5)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_4)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_2)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_3)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_2)
  end

  describe "instance methods" do
    describe "#ingredients_for_show" do
      it 'orders chef ingredients by calories and removes duplicates' do
        expect(@chef_1.ingredients_for_show[0].name).to eq('Chili')
        expect(@chef_1.ingredients_for_show[1].name).to eq('Tortilla chips')
        expect(@chef_1.ingredients_for_show[2].name).to eq('Tortilla')
        expect(@chef_1.ingredients_for_show[3].name).to eq('Cheese')
      end
    end
  end
end
