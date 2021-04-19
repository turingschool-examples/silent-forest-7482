
require 'rails_helper'

RSpec.describe 'chef show page' do
	before(:each) do
		@chef = Chef.create!(name: "Joey")
		@dish_1 = @chef.dishes.create!(name: "mac & cheese", description: "super cheesy")
    @dish_2 = @chef.dishes.create!(name: "ramen", description: "extra spicy")
		@dish_3 = @chef.dishes.create!(name: "pizza", description: "deep dish")
		@ingredient_1 = Ingredient.create!(name: "cheese", calories: 100)
		@ingredient_2 = Ingredient.create!(name: "salt", calories: 0)
		@ingredient_3 = Ingredient.create!(name: "veggie broth", calories: 80)
		@ingredient_4 = Ingredient.create!(name: "eggs", calories: 150)
		@ingredient_5 = Ingredient.create!(name: "noodles", calories: 300)
		@ingredient_6 = Ingredient.create!(name: "flour", calories: 105)
		@dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
		@dish_ingredient_2 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_5)
		@dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_2)
		@dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5)
		@dish_ingredient_1 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_1)
		@dish_ingredient_1 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_6)
		
	end
	it 'shows the chef details and dishs' do
		visit "/chefs/#{@chef.id}"

    expect(page).to have_content("Chef Show Page")
    expect(page).to have_content("#{@chef.name}")
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
	it 'shows the chef ingredients, uniq, and in order of calories' do
		visit "/chefs/#{@chef.id}"


		within "#ingredient-#{@ingredient_5.id}" do 
			expect(page).to have_content(@ingredient_5.name)
			expect(page).to have_content(@ingredient_5.calories)
		end
    within "#ingredient-#{@ingredient_6.id}" do 
			expect(page).to have_content(@ingredient_6.name)
			expect(page).to have_content(@ingredient_6.calories)
		end
		within "#ingredient-#{@ingredient_1.id}" do 
			expect(page).to have_content(@ingredient_1.name)
			expect(page).to have_content(@ingredient_1.calories)
		end

    within "#ingredient-#{@ingredient_2.id}" do 
			expect(page).to have_content(@ingredient_2.name)
			expect(page).to have_content(@ingredient_2.calories)
		end
	end
	it 'shows a button to delete a dish from the chef show page and when selected it no longer is displayed' do
		visit "/chefs/#{@chef.id}"

		within "#dish-#{@dish_1.id}" do 
			expect(page).to have_button("Delete")
			click_button('Delete')
		end
		current_path "/chefs/#{@chef.id}"
		expect(page).to_no have_content(@dish_1.name)
	end
end

<%= link_to "Delete #{shelter.name}", "/shelters/#{shelter.id}", method: :delete %>