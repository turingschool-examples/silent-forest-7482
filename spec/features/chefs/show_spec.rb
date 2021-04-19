require 'rails_helper'

RSpec.describe "Chef Show Page" do
  describe "As a visitor" do
    context "When I visit a chefs show page" do
      before :each do
        @chef = Chef.create!(name: "Mario")
        @dish_1 = Dish.create!(name: 'lasagna', description: 'vegan with red sauce', chef_id: @chef.id)
        @dish_2 = Dish.create!(name: 'pizza', description: 'cheese and pepperoni', chef_id: @chef.id)
        @dish_3 = Dish.create!(name: 'steak', description: 'filet with pepper sauce', chef_id: @chef.id)
        visit chef_path(@chef)
      end

      it "Then I see the name of the chef" do
        expect(page).to have_content(@chef.name)
      end

      it "And I see the names and descriptions of all the chefs dishes" do
        within ".dish-describe" do
          expect(page).to have_content(@dish_1.name)
          expect(page).to have_content(@dish_2.name)
          expect(page).to have_content(@dish_3.name)
          expect(page).to have_content(@dish_1.description)
          expect(page).to have_content(@dish_2.description)
          expect(page).to have_content(@dish_3.description)
        end
      end

      it "Then I see the name and calories of all ingredients used in dishes" do
        within ".ingredients-describe" do

        end
      end
    end
  end

end
