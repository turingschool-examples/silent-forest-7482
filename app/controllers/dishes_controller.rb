class DishesController < ApplicationController
  def index
    @chief = Chief.find(params[:chief_id])
    @dishes = @chief.dishes
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def destroy
    Dish.find(params[:id])
    DishIngredient.delete(params[:dish_id])

    redirect_to "/chefs/#{@chef.id}"
  end
end
