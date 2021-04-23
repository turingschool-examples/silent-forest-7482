class IngredientsController < ApplicationController
  def index
    @dish = Dish.find(params[:dish_id])
    @ingredients = @dish.ingredients
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end
end
