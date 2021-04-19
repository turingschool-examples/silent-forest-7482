# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef1 = Chef.create!(name: 'Chef 1')
@dish1 = @chef1.dishes.create!(name: 'Dish 1', description: 'first description')
@dish2 = @chef1.dishes.create!(name: 'Dish 2', description: 'second description')

@ingredient1 = Ingredient.create!(name: 'One', calories: 100)
@ingredient2 = Ingredient.create!(name: 'Two', calories: 220)
@ingredient3 = Ingredient.create!(name: 'Three', calories: 7)
@ingredient4 = Ingredient.create!(name: 'Four', calories: 29)

@recipe1 = Recipe.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
@recipe2 = Recipe.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
@recipe3 = Recipe.create!(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
@recipe4 = Recipe.create!(dish_id: @dish2.id, ingredient_id: @ingredient1.id)
@recipe5 = Recipe.create!(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
