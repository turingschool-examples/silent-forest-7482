require 'rails_helper'

RSpec.describe "Chef Show Page" do
  describe "As a visitor" do
    context "When I visit a chefs show page" do
      before :each do
        @chef = Chef.create!(name: "Mario")

        visit chef_path(@chef)
      end

      it "Then I see the name of the chef" do

        expect(page).to have_content(@chef.name)
      end

      it "And I see the names and descriptions of all the chefs dishes" do
        
      end
    end
  end

#
# As a visitor
# When I visit a chef's show page
# Then I see the name of the chef
# And I see the names and descriptions of all the chef's dishes
end
