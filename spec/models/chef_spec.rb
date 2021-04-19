require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:recipes).through(:dishes)}
    it {should have_many(:ingredients).through(:recipes)}
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
    describe "#uniq_ingredients" do
      it "gets unique ingredients for that chef" do
        expect(@chef1.uniq_ingredients).to eq([@ingredient2, @ingredient1, @ingredient4])
        expect(@chef1.uniq_ingredients).to_not eq([@ingredient2, @ingredient1, @ingredient4, @ingredient4])
      end
    end

    describe "#top_3_ingredients" do
      it "gets 3 most popular ingredients for that chef" do
        expect(@chef1.top_3_ingredients).to eq([@ingredient1, @ingredient4, @ingredient2])
      end
    end
  end
end
