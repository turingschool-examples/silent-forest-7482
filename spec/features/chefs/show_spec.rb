require 'rails_helper'

RSpec.describe 'Chef' do
  describe 'when I visit chef show page' do
    before :each do
      @chef1 = create(:chef)
      @chef2 = create(:chef)

      @dish1 = create(:dish, chef_id: @chef1.id)
      @dish2 = create(:dish, chef_id: @chef1.id)
      @dish3 = create(:dish, chef_id: @chef2.id)

      @ingredient1 = create(:ingredient, dish_id: @dish1.id)
      @ingredient2 = create(:ingredient, dish_id: @dish2.id)
      @ingredient3 = create(:ingredient, dish_id: @dish1.id)
      @ingredient4 = create(:ingredient, dish_id: @dish3.id)

      visit "chefs/#{@chef1.id}"
    end

    it 'shows the name of the chef' do
      expect(page).to have_content(@chef1.name)
    end

    it 'shows names and descriptions of all the chefs dishes' do
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish2.description)
      expect(page).not_to have_content(@dish3.name)
    end

    it 'shows the name and calories of all ingredients this chef uses in their dishes' do
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient3.calories)
      save_and_open_page
    end
  end
end
