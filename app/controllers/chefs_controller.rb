class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @dish_ingredients = DishIngredient.all
  end

  def remove_dish
    chef = Chef.find(params[:id])
    dish = Dish.find(params[:dish_id])

    chef.dishes.delete(dish)

    redirect_to chef_path(chef)
  end
end