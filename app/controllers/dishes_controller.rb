class DishesController < ApplicationController

  def destroy
    Dish.find(params[:id]).destroy
    redirect_to "/chefs/#{@chef.id}"
  end
end
