require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  before(:each) do
    @chef = Chef.create!(name: 'Mike Piz')

    @dish_1 = @chef.dishes.create!(name: 'ravioli', description: 'chef boy rds')
    @dish_2 = @chef.dishes.create!(name: 'poptart', description: 'toaster ready and yummy')
    @dish_3 = @chef.dishes.create!(name: 'ribeye steak', description: 'expensive, lovely, and fresh')

    @ingredient_1 = @dish_1.ingredients.create!(name: 'italian pasta sauce', calories: 100)
    @ingredient_2 = @dish_2.ingredients.create!(name: 'unknown chocolate', calories: 30)
    @ingredient_3 = @dish_3.ingredients.create!(name: 'Salt and pepper', calories: 10)
  end

  describe 'instance methods' do
    describe '#ingredient_names_and_calories' do
      it 'names of all of a chefs ingredients sorted by most calories first' do
        expect(@chef.ingredient_names_and_calories).to eq([@ingredient_1.name, @ingredient_1.calories, @ingredient_2.name, @ingredient_2.calories, @ingredient_3.name, @ingredient_3.calories])
      end
    end
  end
end
