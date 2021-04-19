# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cookbook.destroy_all
Dish.destroy_all
Ingredient.destroy_all
Chef.destroy_all

ramsay = Chef.create(name: "Gordon Ramsay")
salmon_dish = ramsay.dishes.create(name: "Sizzled Salmon", description: "Sizzled and Fizzled, delectable delight.")
salmon_dish.ingredients.create(name: "Butter", calories: 150)
salmon_dish.ingredients.create(name: "Salmon", calories: 430)
salmon_dish.ingredients.create(name: "Thyme", calories: 1)

ice_cream_dish = ramsay.dishes.create(name: "Thyme Pecan Ice Cream", description: "Nice way to end a fishy note")
ice_cream_dish.ingredients.create(name: "Ice Cream", calories: 150)
ice_cream_dish.ingredients.create(name: "Thyme", calories: 1)

flay = Chef.create(name: "Bobby Flay")
steak_dish = flay.dishes.create(name: "Grilled Steak", description: "Anything above medium rare is controversial")
steak_dish.ingredients.create(name: "Rib-eye", calories: 550)
steak_dish.ingredients.create(name: "Butter", calories: 150)

ray = Chef.create(name: "Rachael Ray")
potato_dish = ray.dishes.create(name: "Lord of the Rings Potatoes", description: "mash 'em, boil 'em, throw 'em in a stew")
potato_dish.ingredients.create(name: "Potato", calories: 500)
potato_dish.ingredients.create(name: "Butter", calories: 150)
