class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @chefs_dishes = Chef.dishes.all
    @chefs_ingredients = Chef.ingredients_ordered_by_calories
  end
end
