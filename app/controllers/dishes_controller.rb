class DishesController < ApplicationController
  def destroy
    dish = Dish.find(params[:id]).destroy
    redirect_to "/chefs/#{params[:chef_id]}"
  end
end
