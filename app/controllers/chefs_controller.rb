class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @ingredients = @chef.dishes_ingredients
  end

end
