class DishesController < ApplicationController

  def destroy
    dish = Dish.find(params[:id])
    chef_id = dish.chef.id
    dish.destroy
    redirect_to "/chefs/#{chef_id}"
  end
end
