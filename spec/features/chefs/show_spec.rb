require 'rails_helper'

RSpec.describe 'the movie show page' do
  before(:each) do
    @chef_1 = Chef.create!(name: "Emril")
    @chef_2 = Chef.create!(name: "Claudia")

    @dish_1 = @chef_1.dishes.create!(name: "Buritto", description: "Burrito with cheese and chili")
    @dish_2 = @chef_1.dishes.create!(name: "Nachos", description: "Nachos with chili and cheese")
    @dish_3 = @chef_2.dishes.create!(name: "Cheese Fries", description: "Fries with cheese")



    @ingredient_1 = Ingredient.create!(name: 'Tortilla', calroies: 200)
    @ingredient_2 = Ingredient.create!(name: 'Cheese', calroies: 100)
    @ingredient_3 = Ingredient.create!(name: 'Potato', calroies: 300)
    @ingredient_4 = Ingredient.create!(name: 'Tortilla chips', calroies: 250)
    @ingredient_5 = Ingredient.create!(name: 'Chili', calroies: 200)



    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_5)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_4)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_2)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_3)
    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_2)

  end


  # it 'lists the movie with its attributes' do
  #   visit "/movies/#{@movie_1.id}"
  #
  #     expect(page).to have_content(@movie_1.title)
  #     expect(page).to have_content(@movie_1.creation_year)
  #     expect(page).to have_content(@movie_1.genre)
  #     expect(page).to have_content(@actor_1.name)
  #     expect(page).to have_content(@actor_2.name)
  #     expect(page).to have_content(@actor_3.name)
  #     expect(page).to have_content(@actor_4.name)
  # end
  #
  # it "an actor can be searched for and added to a movie" do
  #     visit "/movies/#{@movie_2.id}"
  #     expect(page).to have_button("Search")
  #
  #     fill_in "Add an Actor to this Movie", with: "Ben Stiller"
  #
  #     click_button 'Search'
  #
  #     expect(page).to have_content(@actor_3.name)
  #
  #   end
end
