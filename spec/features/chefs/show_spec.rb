require 'rails_helper'

RSpec.describe 'Chef' do
  describe 'when I visit chef show page' do
    before :each do
      @chef1 = create(:chef)
      @chef2 = create(:chef)

      @dish1 = create(:dish, chef_id: @chef1.id)
      @dish2 = create(:dish, chef_id: @chef1.id)
      @dish3 = create(:dish, chef_id: @chef2.id)

      visit "chefs/#{@chef1.id}"
    end

    it 'shows the name of the chef' do
      expect(page).to have_content(@chef1.name)
    end
  end
end
