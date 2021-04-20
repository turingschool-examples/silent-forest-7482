class DishesController < ApplicationController

  def destroy
    Dish.destroy(params[:id])

    redirect_to '/chefs/chef_id'
  end
end
