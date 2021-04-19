require 'rails_helper'

describe 'chef show page' do
  context 'when you land on the page' do
    before {
      @chef = Chef.create!(name: "George")
      @dish_1 = Dish.create!(name: "dish_1", description: 'this is dish 1', chef_id: @chef.id)
      @dish_2 = Dish.create!(name: "dish_2", description: 'this is dish 2', chef_id: @chef.id)

      visit chef_path(@chef)
    }

    it 'shows you the name of the chef' do
      expect(page).to have_content("George")
    end

    it "shows all of the names and descriptions of the chef's dishes" do
      expect(page).to have_content("dish_1")
      expect(page).to have_content("this is dish 1")
      expect(page).to have_content("dish_2")
      expect(page).to have_content("this is dish 2")
    end
  end

  context 'you look at the ingredients section' do
    before {
      @chef = Chef.create!(name: "George")

      @dish_1 = Dish.create!(name: "dish_1", description: 'this is dish 1', chef_id: @chef.id)
      @dish_2 = Dish.create!(name: "dish_2", description: 'this is dish 2', chef_id: @chef.id)

      @ingredient_1 = Ingredient.create!(name: "ingredient_1", calories: 10)
      @ingredient_2 = Ingredient.create!(name: "ingredient_2", calories: 20)

      @dish_1.ingredients << @ingredient_1
      @dish_1.ingredients << @ingredient_2
      @dish_2.ingredients << @ingredient_1

      visit chef_path(@chef)
    }

    it 'shows the name and calories for all ingredients' do
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_1.calories)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_2.calories)
    end

    it 'shows all the ingredients are unique' do
      expect(page).to have_css("ingredient", :count => 2)
    end

    it 'shows all the ingredients are ordered by calories desc' do
      expect(@ingredient_2.name).to appear_before(@ingredient_1.name)
    end
  end
end