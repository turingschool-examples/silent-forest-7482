require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :calories}
  end

  describe "relationships" do
    it {should have_many :cookbooks}
    it {should have_many(:dishes).through(:cookbooks)}
  end

  describe 'model methods' do
    it 'can return unique ingredients ordered from most calories to least' do
      ramsay = Chef.create(name: "Gordon Ramsay")
      salmon_dish = ramsay.dishes.create(name: "Sizzled Salmon", description: "Sizzled and Fizzled, delectable delight.")
      butter = salmon_dish.ingredients.create(name: "Butter", calories: 150)
      salmon = salmon_dish.ingredients.create(name: "Salmon", calories: 430)
      thyme1 = salmon_dish.ingredients.create(name: "Thyme", calories: 1)

      ice_cream_dish = ramsay.dishes.create(name: "Thyme Pecan Ice Cream", description: "Nice way to end a fishy note")
      ice_cream = ice_cream_dish.ingredients.create(name: "Ice Cream", calories: 650)
      thyme2 = ice_cream_dish.ingredients.create(name: "Thyme", calories: 1)

      expect(Chef.unique_ingredients_ordered_from_highest_calories).to eq(["Ice Cream", "Salmon", "Butter", "Thyme"])
    end
  end
end
