# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef_1 = Chef.create!(name: "Amy")
@dish_1 = @chef_1.dishes.create!(name: "Alfredo", description: "Creamy Pasta")
@dish_2 = @chef_1.dishes.create!(name: "Carrot Pie", description: "Pup fav")
@ing_1 = Ingredient.create!(name: "carrots", calories: 100)
@ing_2 = Ingredient.create!(name: "milk", calories: 200)
@ing_3 = Ingredient.create!(name: "cheese", calories: 300)
Recipe.create!(dish: @dish_1, ingredient: @ing_1)
Recipe.create!(dish: @dish_1, ingredient: @ing_2)
Recipe.create!(dish: @dish_2, ingredient: @ing_3)
