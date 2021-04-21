# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@chef = Chef.create!(name: "Kernel Sanders")
@chicken = @chef.dishes.create!(name: "Kentucky Fried Chicken", description: "Very crispy chicken")
@mashed_potatoes = @chef.dishes.create!(name: "Mashed Potatoes", description: "Very buttery potatoes")
@batter = @chicken.ingredients.create!(name: "Chicken Batter", calories: 450)
@butter = @mashed_potatoes.ingredients.create!(name: "Butter", calories: 500)
@salt = @mashed_potatoes.ingredients.create!(name: "Salt", calories: 5)
@pepper = @mashed_potatoes.ingredients.create!(name: "Pepper", calories: 5)
@milk = @mashed_potatoes.ingredients.create!(name: "Milk", calories: 250)
DishIngredient.create!(dish: @chicken, ingredient: @batter)
DishIngredient.create!(dish: @mashed_potatoes, ingredient: @butter)
DishIngredient.create!(dish: @mashed_potatoes, ingredient: @batter)
DishIngredient.create!(dish: @mashed_potatoes, ingredient: @salt)
DishIngredient.create!(dish: @mashed_potatoes, ingredient: @pepper)
DishIngredient.create!(dish: @chicken, ingredient: @pepper)
DishIngredient.create!(dish: @chicken, ingredient: @salt)
DishIngredient.create!(dish: @mashed_potatoes, ingredient: @milk)
