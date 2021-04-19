require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should belong_to :dish}
  end

  describe 'methods' do
    it 'can return sorted ingredients' do

      chef1 = create(:chef)

      dish1 = create(:dish, chef_id: chef1.id)
      dish2 = create(:dish, chef_id: chef1.id)

      ingredient1 = create(:ingredient, dish: dish1, calories: 70, name: "Unique Ingredient")
      ingredient2 = create(:ingredient, dish: dish1, name: "Repeating Ingredient", calories: 800)
      ingredient3 = create(:ingredient, dish: dish2, name: "Repeating Ingredient", calories: 800)

      # expect(Ingredient.ordered_unique).to eq([ingredient2, ingredient1])
    end
  end
end
