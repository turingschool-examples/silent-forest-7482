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

pat = Chef.create!(name: "Pat Smith")
jill = Chef.create!(name: "Jill Jones")

coucous = pat.dishs.create!(name: "Coucous", description: "Healthy grain")
lamb = pat.dishs.create!(name: "Farm Lamb", description: "Savory protein")
pilaf = jill.dishs.create!(name: "Pilaf", description: "Wild rices")
crispy = jill.dishs.create!(name: "Crispy Chicken", description: "Fine foul")

salt = Ingredient.create!(name: "Salt", calories: 3)
butter = Ingredient.create!(name: "Butter", calories: 102)
oil = Ingredient.create!(name: "Olive Oil", calories: 250)
grain = Ingredient.create!(name: "Grain", calories: 37)
