require 'rails_helper'

RSpec.describe 'Chef show page' do
  describe 'As a visitor' do
    describe "When I visit a chef's show page" do
      before :each do
        @chef1 = Chef.create!(name: 'Chef 1')
        @dish1 = @chef1.dishes.create!(name: 'Dish 1', description: 'first description')
        @dish2 = @chef1.dishes.create!(name: 'Dish 2', description: 'second description')

        @ingredient1 = Ingredient.create!(name: 'One', calories: 100)
        @ingredient2 = Ingredient.create!(name: 'Two', calories: 220)
        @ingredient3 = Ingredient.create!(name: 'Three', calories: 7)
        @ingredient4 = Ingredient.create!(name: 'Four', calories: 29)

        @recipe1 = Recipe.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
        @recipe2 = Recipe.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
        @recipe3 = Recipe.create!(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
        @recipe4 = Recipe.create!(dish_id: @dish2.id, ingredient_id: @ingredient1.id)
        @recipe5 = Recipe.create!(dish_id: @dish2.id, ingredient_id: @ingredient4.id)

        visit chef_path(@chef1)
      end

      it "I see the name of the chef" do
        save_and_open_page
        expect(page).to have_content(@chef1.name)

      end

      it "And I see the names and descriptions of all the chef's dishes" do
        within ".dish-#{@dish1.id}" do
          expect(page).to have_content(@dish1.name)
          expect(page).to have_content(@dish1.description)
        end

        within ".dish-#{@dish2.id}" do
          expect(page).to have_content(@dish2.name)
          expect(page).to have_content(@dish2.description)
        end
      end
    end
  end
end
