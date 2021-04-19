class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def destroy
    dish = Dish.find(params[:id])
    recipe = Recipe.find(dish_id: dish.id)
    dish.destroy
    redirect_to "/chefs/#{@chef.id}"
  end
end
