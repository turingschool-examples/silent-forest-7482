# class RecipesController < ApplicationController
#   def destroy
#     # @chef = Chef.find(params[:id])
#     # Recipe.delete(params[:id], params[:dish_id])
#     #
#     # redirect_to chef_path(@chef)
#     di = Recipe.where(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id]).first
#     di.destroy
#
#     redirect_to "/dishes/#{params[:dish_id]}"
#   end
# end
