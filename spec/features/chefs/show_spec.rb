require 'rails_helper'

RSpec.describe 'Chef' do
  describe 'when I visit chef show page' do
    before :each do
      @chef1 = create(:chef)
      @chef2 = create(:chef)

      @dish1 = create(:dish, chef_id: @chef1.id)
      @dish2 = create(:dish, chef_id: @chef1.id)
      @dish3 = create(:dish, chef_id: @chef2.id)

      @ingredient1 = create(:ingredient, dish: @dish1)
      @ingredient2 = create(:ingredient, dish: @dish1, name: "Repeating Ingredient", calories: 800)
      @ingredient3 = create(:ingredient, dish: @dish2, name: "Repeating Ingredient", calories: 800)

      visit "chefs/#{@chef1.id}"
    end

    it 'shows the name of the chef' do
      expect(page).to have_content(@chef1.name)
      expect(page).not_to have_content(@chef2.name)

    end

    it 'shows names and descriptions of all the chefs dishes' do
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish2.description)
    end

    it 'shows the name and calories of all ingredients this chef uses in their dishes' do
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient3.calories)
    end

    it 'can delete a dish' do
      expect(page).to have_button("Delete #{@dish1.name}")

      click_button("Delete #{@dish1.name}")
save_and_open_page
      expect(page).not_to have_content(@dish1.name)
    end
  end
end
