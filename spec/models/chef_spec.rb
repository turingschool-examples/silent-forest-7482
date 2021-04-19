require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    describe 'ingredients' do
      it 'returns all ingredients used by chef, no duplicates, by calories desc' do
        chef = Chef.create!(name: "Anthony")
        dish1 = chef.dishes.create!(name: "Yum", description: "Very yum")
        dish2 = chef.dishes.create!(name: "Tasty", description: "Very tasty")
        ingredient2 = dish1.ingredients.create!(name: "carrot", calories: 20)
        ingredient6 = dish2.ingredients.create!(name: "onion", calories: 10)
        ingredient1 = dish1.ingredients.create!(name: "onion", calories: 10)
        ingredient5 = dish2.ingredients.create!(name: "butter", calories: 50)
        ingredient4 = dish2.ingredients.create!(name: "garlic", calories: 40)
        ingredient3 = dish1.ingredients.create!(name: "potato", calories: 30)
        
        expect(chef.ingredients).to eq({"butter"=>50, "garlic"=>40, "potato"=>30, "carrot"=>20, "onion"=>10})
      end
    end

    describe 'most_popular_ingredients' do
      it 'returns the three most used ingredients in the chefs dishes' do
        chef = Chef.create!(name: "Anthony")

        dish1 = chef.dishes.create!(name: "Yum", description: "Very yum")
        dish2 = chef.dishes.create!(name: "Tasty", description: "Very tasty")
        dish3 = chef.dishes.create!(name: "Wow", description: "good")
        dish4 = chef.dishes.create!(name: "Wowzers", description: "excellent")
        dish5 = chef.dishes.create!(name: "Fricken Yum", description: "Very good")
        dish6 = chef.dishes.create!(name: "Ugh", description: "yum yum")

        ingredient3 = Ingredient.create!(name: "potato", calories: 30)
        ingredient1 = Ingredient.create!(name: "onion", calories: 10)
        ingredient5 = Ingredient.create!(name: "butter", calories: 50)
        ingredient4 = Ingredient.create!(name: "garlic", calories: 40)
        ingredient2 = Ingredient.create!(name: "carrot", calories: 20)

        dish1.ingredients.push(ingredient3, ingredient5, ingredient4)
        dish2.ingredients.push(ingredient3, ingredient5, ingredient4)
        dish3.ingredients.push(ingredient3, ingredient5, ingredient4)
        dish4.ingredients.push(ingredient1, ingredient5, ingredient4)
        dish5.ingredients.push(ingredient1, ingredient5, ingredient2)
        dish6.ingredients.push(ingredient5, ingredient2)
        #butter => 6
        #garlic => 4
        #potato => 3
        #onion => 2
        #carrot => 2

        expect(chef.most_popular_ingredients).to eq([ingredient5, ingredient4, ingredient3])
      end
    end
  end
end
