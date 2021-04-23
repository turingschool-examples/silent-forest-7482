class DishesController < ApplicationController
  def destroy
    DishIngredient.where(dish_id: params[:id]).destroy_all
    Dish.destroy(params[:id])
    @chef = Chef.find(params[:chef_id])
    redirect_to chef_path(@chef.id)
  end
end
