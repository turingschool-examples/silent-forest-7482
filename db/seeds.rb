# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Chef.destroy_all
Dish.destroy_all
Ingredient.destroy_all
DishIngredient.destroy_all

chef1 = Chef.create!(name: 'Gordon Ramsay')
chef2 = Chef.create!(name: 'Linguine')

dish1 = chef1.dishes.create!(name: 'Meatloaf', description: 'it is meatloaf')
dish2 = chef1.dishes.create!(name: 'Filet Mignon', description: 'it is steak')
dish3 = chef2.dishes.create!(name: 'Omelete', description: 'made with real eggs')
dish4 = chef2.dishes.create!(name: 'Ratatouille', description: 'like in the movie')

ingr1 = Ingredient.create!(name: 'beef', calories: 150)
ingr2 = Ingredient.create!(name: 'egg', calories: 100)
ingr3 = Ingredient.create!(name: 'onion', calories: 70)
ingr4 = Ingredient.create!(name: 'bell pepper', calories: 65)

DishIngredient.create!(dish: dish1, ingredient: ingr1)
DishIngredient.create!(dish: dish1, ingredient: ingr2)
DishIngredient.create!(dish: dish1, ingredient: ingr3)
DishIngredient.create!(dish: dish2, ingredient: ingr1)
DishIngredient.create!(dish: dish3, ingredient: ingr2)
DishIngredient.create!(dish: dish3, ingredient: ingr3)
DishIngredient.create!(dish: dish4, ingredient: ingr3)
DishIngredient.create!(dish: dish4, ingredient: ingr4)