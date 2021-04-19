class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @ingredients = Ingredient.all
  end
end