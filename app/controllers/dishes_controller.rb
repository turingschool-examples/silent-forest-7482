class DishesController < ApplicationController
  def destroy
    dish = Dish.find(params[:id])
    dish_ingredient = DishIngredient.where('dish_id = ?', dish.id )
    dish_ingredient.each do |d|
      d.delete
    end
    Dish.delete(dish)
    redirect_to "/chefs/#{params[:chef_id]}"
  end
end