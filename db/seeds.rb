@chef_1 = Chef.create!(name: "Iron Wokman")
@chef_2 = Chef.create!(name: "Top Cookerman")

@dish_1 = @chef_1.dishes.create!(name: "Dish_1", description: "Tasty")
@dish_2 = @chef_1.dishes.create!(name: "Dish_2", description: "Spicy")
@dish_3 = @chef_2.dishes.create!(name: "Dish_3", description: "Greasy")

@ingredient_1 = Ingredient.create!(name: "Ingredient_1", calories: 10)
@ingredient_2 = Ingredient.create!(name: "Ingredient_2", calories: 20)
@ingredient_3 = Ingredient.create!(name: "Ingredient_3", calories: 15)
@ingredient_4 = Ingredient.create!(name: "Ingredient_4", calories: 50)

@ingredient_5 = Ingredient.create!(name: "Ingredient_5", calories: 100)
@ingredient_6 = Ingredient.create!(name: "Ingredient_5", calories: 200)

DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)

DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_3.id)
DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)

DishIngredient.create(dish_id: @dish_3.id, ingredient_id: @ingredient_5.id)
DishIngredient.create(dish_id: @dish_3.id, ingredient_id: @ingredient_6.id)
