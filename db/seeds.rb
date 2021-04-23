# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



DishIngredient.destroy_all
Dish.destroy_all
Ingredient.destroy_all
Chef.destroy_all


chef_a = Chef.create!(name: "albert")
chef_b = Chef.create!(name: "bob")

dish_1 = chef_a.dishes.create!(name: "a1 barbique", description: "hot and spicy")
dish_2 = chef_a.dishes.create!(name: "abc soop", description: "words words words")
dish_3 = chef_b.dishes.create!(name: "bee honey tea", description: "fancy stuff")
dish_4 = chef_b.dishes.create!(name: "beverage supprize", description: "it's a supprize")


water = Ingredient.create!(name: "water", calories: 0)
spicy = Ingredient.create!(name: "spicy", calories: 5)
sweet = Ingredient.create!(name: "sweet", calories: 20)
secret = Ingredient.create!(name: "secret", calories: 10)

dish_ingredient_1a = DishIngredient.create!(ingredient: spicy, dish: dish_1 )
dish_ingredient_1b = DishIngredient.create!(ingredient: sweet, dish: dish_1 )
dish_ingredient_2a = DishIngredient.create!(ingredient: secret, dish: dish_2 )
dish_ingredient_2b = DishIngredient.create!(ingredient: water, dish: dish_2 )

dish_ingredient_3a = DishIngredient.create!(ingredient: water, dish: dish_3 )
dish_ingredient_3b = DishIngredient.create!(ingredient: sweet, dish: dish_3 )
dish_ingredient_4a = DishIngredient.create!(ingredient: water, dish: dish_4 )
dish_ingredient_4b = DishIngredient.create!(ingredient: spicy, dish: dish_4 )
