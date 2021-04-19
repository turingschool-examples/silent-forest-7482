class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @dish_ingredients = DishIngredient.all
  end
end