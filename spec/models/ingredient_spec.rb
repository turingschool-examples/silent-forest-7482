require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :calories}
  end
  describe "relationships" do
    it {should have_many(:dishes).through(:recipes)}
  end

  describe 'class method' do
    before(:each) do
      @flour = Ingredient.create(name: "flour", calories: 40)
      @flour1 = Ingredient.create(name: "flour", calories: 40)
      @eggs = Ingredient.create(name: "eggs", calories: 90)
      @butter = Ingredient.create(name: "butter", calories: 150)
    end

  describe '::ingredients_used' do
    it 'finde ingredients with distinct names, and calories by highest calorie' do
      expect(Ingredient.ingredients_used).to eq([@butter, @eggs, @flour])
      expect(Ingredient.ingredients_used).to_not eq([@flour1])
    end
  end

  end
end
