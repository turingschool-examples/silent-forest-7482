class DishesController < ApplicationController
  def index
    @chief = Chief.find(params[:chief_id])
    @dishes = @chief.dishes
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
