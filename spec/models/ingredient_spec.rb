require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :calories}
    it {should validate_numbericality_of :calories}
  end
  describe "relationships" do
    it {should belong_to :dish}
    it {should have_many :dishes}
  end
end
