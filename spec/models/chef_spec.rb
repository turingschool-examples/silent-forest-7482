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
  end
end
