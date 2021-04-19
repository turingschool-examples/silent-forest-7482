require 'rails_helper'

RSpec.describe 'chef show page' do
  before :each do
    @chef = Chef.create!(name: 'Linguine')
    @dish1 = @chef.dishes.create!(name: 'Omelete', description: 'made with real eggs')
    @dish2 = @chef.dishes.create!(name: 'Ratatouille', description: 'like in the movie')
    
    visit "/chefs/#{@chef.id}"
  end

  context 'you are on the chef show page' do
    it 'you see the name of the chef' do
      expect(page).to have_content(@chef.name)
    end

    it 'you see the names & descriptions of all dishes belonging to the chef' do
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish2.name)

      expect(page).to have_content(@dish1.description)
      expect(page).to have_content(@dish2.description)
    end
  end
end