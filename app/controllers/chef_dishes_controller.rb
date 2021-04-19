# class ChefDishesController < ApplicationController
#   def destroy
#    chef = Chef.find(params[:chef_id])
#    dish_ingredient = Recipe.find_by(dish_id: params[:id], ingredient_id: params[:ingredient_id])
#    dish_ingredient.destroy
#    redirect_to chef_path(params[:id])
#
#
#    #  dish = Dish.find(params[:id])
#    #  dish.destroy
#    #  chef = Chef.find(params[:chef_id])
#    #  redirect_to "/chefs/#{chef.id}"
#    # di = DishIngredient.where(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id]).first
#    # di.destroy
#   end
# end
