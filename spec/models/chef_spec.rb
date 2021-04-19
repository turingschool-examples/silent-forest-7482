require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    before :each do
      @chef = Chef.create!(name: "Mario")
      @dish_1 = Dish.create!(name: 'lasagna', description: 'vegan with red sauce', chef_id: @chef.id)
      @dish_2 = Dish.create!(name: 'pizza', description: 'cheese and pepperoni', chef_id: @chef.id)
      @ingredient_1 = Ingredient.create!(name: 'tomato', calories: 45)
      @ingredient_2 = Ingredient.create!(name: 'flour', calories: 95)
      @ingredient_3 = Ingredient.create!(name: 'pepperoni', calories: 60)
      @dish_1.ingredients << [@ingredient_1, @ingredient_2, @ingredient_3]
      @dish_2.ingredients << [@ingredient_2, @ingredient_3]
    end
    describe "#dishes_ingredients" do
      it "returns the unique ingredients of a chefs dishes" do
        expect(@chef.dishes_ingredients).to eq([@ingredient_1, @ingredient_2, @ingredient_3])
      end
    end
  end
end
