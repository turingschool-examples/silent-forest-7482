require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many :ingredients}
  end

  describe "instance methods" do
    before :each do
      @chef = Chef.create!(name: "Mario")
      @dish_1 = Dish.create!(name: 'lasagna', description: 'vegan with red sauce', chef_id: @chef.id)
      @dish_2 = Dish.create!(name: 'pizza', description: 'cheese and pepperoni', chef_id: @chef.id)
      @dish_3 = Dish.create!(name: 'steak', description: 'filet with pepper sauce', chef_id: @chef.id)
      @dish_4 = Dish.create!(name: 'shrimp', description: 'boiled and seasoned', chef_id: @chef.id)
      @ingredient_1 = Ingredient.create!(name: 'tomato', calories: 45)
      @ingredient_2 = Ingredient.create!(name: 'flour', calories: 95)
      @ingredient_3 = Ingredient.create!(name: 'pepperoni', calories: 60)
      @ingredient_4 = Ingredient.create!(name: 'sausage', calories: 80)
      @ingredient_5 = Ingredient.create!(name: 'carrot', calories: 30)
      @ingredient_6 = Ingredient.create!(name: 'chili', calories: 25)
      @dish_1.ingredients << [@ingredient_1, @ingredient_2, @ingredient_3]
      @dish_2.ingredients << [@ingredient_2, @ingredient_3, @ingredient_4, @ingredient_5]
      @dish_3.ingredients << [@ingredient_5, @ingredient_6, @ingredient_2]
      @dish_4.ingredients << [@ingredient_2, @ingredient_3]
    end
    # describe ".most_popular_ingredients" do
      # it "returns the ingredients the chef uses most often in dishes" do
      #   expect(@chef.most_popular_ingredients).to eq([@ingredient_2, @ingredient_3, @ingredient_5])
      # end
    # end
  end
end
