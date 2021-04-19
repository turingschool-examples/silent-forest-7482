# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DishIngredient.destroy_all
Ingredient.destroy_all
Dish.destroy_all
Chef.destroy_all

chef = Chef.create!(name: "Anthony")
dish1 = chef.dishes.create!(name: "Yum", description: "Very yum")
dish2 = chef.dishes.create!(name: "Tasty", description: "Very tasty")
ingredient2 = dish1.ingredients.create!(name: "carrot", calories: 20)
ingredient1 = dish1.ingredients.create!(name: "onion", calories: 10)
ingredient5 = dish2.ingredients.create!(name: "butter", calories: 50)
ingredient4 = dish2.ingredients.create!(name: "garlic", calories: 40)
ingredient3 = dish1.ingredients.create!(name: "potato", calories: 30)