
require 'rails_helper'

RSpec.describe 'chef show page' do
	before(:each) do
		@chef_1 = Chef.create!(name: "Joey")
		@dish_1 = @chef_1.dishes.create!(name: "mac & cheese", description: "super cheesy")
    @dish_2 = @chef_1.dishes.create!(name: "ramen", description: "extra spicy")
		@dish_3 = @chef_1.dishes.create!(name: "pizza", description: "deep dish")
	end
	it 'shows the chef details and dishs' do
		visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content("Chef Show Page")
    expect(page).to have_content("#{@chef_1.name}")
    expect(page).to have_content("Chef's Dishes")


		within "#dish-#{@dish_1.id}" do 
			expect(page).to have_content(@dish_1.name)
			expect(page).to have_content(@dish_1.description)
		end
    within "#dish-#{@dish_2.id}" do 
      expect(page).to have_content(@dish_2.name)
			expect(page).to have_content(@dish_2.description)
		end
    within "#dish-#{@dish_3.id}" do 
      expect(page).to have_content(@dish_3.name)
			expect(page).to have_content(@dish_3.description)
		end
	end
end
