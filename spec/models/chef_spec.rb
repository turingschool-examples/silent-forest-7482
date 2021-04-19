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
      @chef = Chef.create!(name: "Kernel Sanders")
      @chicken = @chef.dishes.create!(name: "Kentucky Fried Chicken", description: "Very crispy chicken")
      @mashed_potatoes = @chef.dishes.create!(name: "Mashed Potatoes", description: "Very buttery potatoes")
      @batter = @chicken.ingredients.create!(name: "Chicken Batter", calories: 450)
      @butter = @mashed_potatoes.ingredients.create!(name: "Butter", calories: 500)
      DishIngredient.create!(dish: @chicken, ingredient: @batter)
      DishIngredient.create!(dish: @mashed_potatoes, ingredient: @butter)
      DishIngredient.create!(dish: @mashed_potatoes, ingredient: @batter)
    end
    describe '#ingredient_list' do
      it 'returns unique ingredients ordered from highest calories to lowest' do
        expect(@chef.ingredient_list.first.name).to eq(@butter.name)
        expect(@chef.ingredient_list.last.name).to eq(@batter.name)
      end
    end
  end
end
