require 'rails_helper'

RSpec.describe Ingredient do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
    it { should validate_numericality_of :calories }
  end

  describe 'relationships' do
    it { should have_many :dishes }
  end

  describe 'instance methods' do
    before :each do
      @chef = Chef.create!(name: 'Linguine')
      @chef2 = Chef.create!(name: 'Gordon Ramsay')
      @dish1 = @chef.dishes.create!(name: 'Omelete', description: 'made with real eggs')
      @dish2 = @chef.dishes.create!(name: 'Ratatouille', description: 'like in the movie')
      @dish3 = @chef2.dishes.create!(name: 'Meatloaf', description: 'it is meatloaf')
      @ingr1 = Ingredient.create!(name: 'onion', calories: 70)
      @ingr2 = Ingredient.create!(name: 'egg', calories: 100)
      @ingr3 = Ingredient.create!(name: 'bell pepper', calories: 65)
      @ingr4 = Ingredient.create!(name: 'beef', calories: 150)
  
      DishIngredient.create!(dish: @dish1, ingredient: @ingr2)
      DishIngredient.create!(dish: @dish1, ingredient: @ingr1)
      DishIngredient.create!(dish: @dish2, ingredient: @ingr1)
      DishIngredient.create!(dish: @dish2, ingredient: @ingr3)
      DishIngredient.create!(dish: @dish3, ingredient: @ingr4)
    end

    it '#ingredients_by_chef' do
      expect(Ingredient.ingredients_by_chef(@chef)).to eq([@ingr2, @ingr1, @ingr3])
    end
  end
end