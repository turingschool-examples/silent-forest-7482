require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "relationships" do
    it {should belong_to(:dish).through(:recipes)}
    it {should belong_to(:ingredient)}
  end
end
