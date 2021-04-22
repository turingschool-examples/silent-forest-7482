require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "relationships" do
    it { should have_many :recipes }
    it { should have_many(:dishes).through(:recipes) }
    it {should have_many(:chefs).through(:dishes)}
  end

  describe "instance methods" do
    before :each do
      @chef1 = Chef.create!(name: 'Chef 1')
      @dish1 = @chef1.dishes.create!(name: 'Dish 1', description: 'first description')
      @dish2 = @chef1.dishes.create!(name: 'Dish 2', description: 'second description')

      @ingredient1 = Ingredient.create!(name: 'One', calories: 100)
      @ingredient2 = Ingredient.create!(name: 'Two', calories: 220)
      @ingredient3 = Ingredient.create!(name: 'Three', calories: 7)
      @ingredient4 = Ingredient.create!(name: 'Four', calories: 29)

      @recipe1 = Recipe.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
      @recipe2 = Recipe.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
      @recipe3 = Recipe.create!(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
      @recipe4 = Recipe.create!(dish_id: @dish2.id, ingredient_id: @ingredient1.id)
      @recipe5 = Recipe.create!(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
    end

    # describe "#popular_ingredients_by_chef" do
    #   it "gets 3 most popular ingredients for that chef" do
    #     ingredients = Ingredient.popular_ingredients_by_chef(@chef1.id)
    #     expect(ingredients.map(&:name)).to eq([@ingredient1.name, @ingredient4.name, @ingredient2.name])
    #   end
    # end
  end
end
