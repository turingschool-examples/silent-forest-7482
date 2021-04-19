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
end