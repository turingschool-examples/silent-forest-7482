class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes
    @ingredients = Ingredient.ingredients_used
  end
end
