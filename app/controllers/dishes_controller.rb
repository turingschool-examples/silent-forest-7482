class DishesController < ApplicationController
  def destroy
    dish = Dish.find(params[:id])
    dish.destroy
    redirect_to "/chefs/#{dish.chef_id}"
  end
end