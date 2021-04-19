require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Amy")
      @dish_1 = @chef_1.dishes.create!(name: "Alfredo", description: "Creamy Pasta")
      @dish_2 = @chef_1.dishes.create!(name: "Carrot Pie", description: "Pup fav")
      @ing_1 = Ingredient.create!(name: "carrots", calories: 100)
      @ing_3 = Ingredient.create!(name: "cheese", calories: 300)
      @ing_2 = Ingredient.create!(name: "milk", calories: 200)
      Recipe.create!(dish: @dish_1, ingredient: @ing_1)
      Recipe.create!(dish: @dish_1, ingredient: @ing_2)
      Recipe.create!(dish: @dish_2, ingredient: @ing_3)
    end

    describe "#ingredient_calories_list" do
      it 'returns a unique list of ingredients ordered from most to least calories' do

      expect(@chef_1.ingredient_calories_list).to eq([@ing_3,@ing_2,@ing_1])
      end
    end
  end
end
