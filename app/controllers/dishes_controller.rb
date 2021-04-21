class DishesController < ApplicationController
  def update
    dish = Dish.find(params[:id])
    old_chef = dish.chef
    dish.remove_from_chef

    redirect_to "/chefs/#{old_chef.id}"
  end
end