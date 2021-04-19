require 'rails_helper'

RSpec.describe 'the chefs show page' do
  before(:each) do
    @chef_1 = Chef.create!(name: "Amy")
    @chef_2 = Chef.create!(name: "Bob")
    @alfredo = @chef_1.dishes.create!(name: "Alfredo", description: "Creamy Pasta")
    @carrots = @chef_1.dishes.create!(name: "Carrots", description: "Pup fav")
    @bob_dish = @chef_2.dishes.create!(name: "Bob's dish", description: "Bobs fav")
  end

  it 'displays the name and description of all the chef dishes' do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content(@chef_1.name)
    expect(page).to have_content(@alfredo.name)
    expect(page).to have_content(@alfredo.description)
    expect(page).to_not have_content(@chef_2.name)
    expect(page).to_not have_content(@bob_dish.description)
    save_and_open_page
  end
end
