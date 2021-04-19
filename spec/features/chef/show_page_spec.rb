require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before(:each) do
    @chef = Chef.create!(name: "Kernel Sanders")
    @chicken = @chef.dishes.create!(name: "Kentucky Fried Chicken", description: "Very crispy chicken")
    @mashed_potatoes = @chef.dishes.create!(name: "Mashed Potatoes", description: "Very buttery potatoes")
    visit "/chefs/#{@chef.id}"
  end

  it 'shows the chefs attributes' do
    expect(page).to have_content(@chef.name)
    expect(page).to have_content("#{@chef.name}'s Dishes")
    expect(page).to have_content(@chicken.name)
    expect(page).to have_content(@chicken.description)
    expect(page).to have_content(@mashed_potatoes.name)
    expect(page).to have_content(@mashed_potatoes.description)
  end
end
