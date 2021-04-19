# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Chef.destroy_all
DishIngredient.destroy_all
Dish.destroy_all
Ingredient.destroy_all

chef_1 = Chef.create!(name: "Emril")
chef_2 = Chef.create!(name: "Claudia")

dish_1 = chef_1.dishes.create!(name: "Buritto", description: "Burrito with cheese and chili")
dish_2 = chef_1.dishes.create!(name: "Nachos", description: "Nachos with chili and cheese")
dish_3 = chef_2.dishes.create!(name: "Cheese Fries", description: "Fries with cheese")

ingredient_1 = Ingredient.create!(name: 'Tortilla', calories: 200)
ingredient_2 = Ingredient.create!(name: 'Cheese', calories: 100)
ingredient_3 = Ingredient.create!(name: 'Potato', calories: 300)
ingredient_4 = Ingredient.create!(name: 'Tortilla chips', calories: 250)
ingredient_5 = Ingredient.create!(name: 'Chili', calories: 200)

dish_ingredient_1 = DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
dish_ingredient_1 = DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)
dish_ingredient_1 = DishIngredient.create!(dish: dish_1, ingredient: ingredient_5)
dish_ingredient_1 = DishIngredient.create!(dish: dish_2, ingredient: ingredient_4)
dish_ingredient_1 = DishIngredient.create!(dish: dish_2, ingredient: ingredient_5)
dish_ingredient_1 = DishIngredient.create!(dish: dish_2, ingredient: ingredient_2)
dish_ingredient_1 = DishIngredient.create!(dish: dish_3, ingredient: ingredient_3)
dish_ingredient_1 = DishIngredient.create!(dish: dish_3, ingredient: ingredient_2)
