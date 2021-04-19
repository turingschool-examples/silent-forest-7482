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
    end
    describe "#dishes_ingredients" do
      it "returns the unique ingredients of a chefs dishes" do
        expect(@chef.dishes_ingredients).to eq()
      end
    end
  end
end
