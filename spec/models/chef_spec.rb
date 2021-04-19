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

  end

  describe 'instance methods' do
    describe '#ingredient_names_and_calories' do
      it 'names of all of a chefs ingredients sorted by most calories first' do
        # expect(@association_3.pet_name).to eq(@pet_3.name)
      end
    end
  end
end
