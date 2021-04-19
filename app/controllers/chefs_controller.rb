class ChefsController < ApplicationController
  def show
    @chef= Chef.find(params[:id])
    @ingredients = Ingredient.ingredients_included_by_cal(@chef.id)
  end
end