require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :ingredients }
  end

  describe 'instance methods' do
    before :each do
      @chef = Chef.create!(name: 'Gordon Ramsay')
      @dish = @chef.dishes.create(name: 'Food', description: 'see name')
    end

    it '#remove_from_chef' do
      expect(@dish.chef).to eq(@chef)
      @dish.remove_from_chef
      expect(@dish.chef).to eq(@chef)
    end
  end
end
