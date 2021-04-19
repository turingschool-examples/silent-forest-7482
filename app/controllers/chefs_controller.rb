class ChefsController < ApplicationController
  def show
    @chef= Chef.find(params[:id])
    binding.pry
    @ingredients = @chef.ingredients.uniq
  end
end