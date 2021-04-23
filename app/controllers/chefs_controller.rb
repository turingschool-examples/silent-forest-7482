class ChefsController < ApplicationController

  def index
  end

  def show
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes
    @ingredients = @chef.chef_ingredients
  end

  def destroy
    @chef = Chef.find(params[:id])
    @dish = Dish.find(params[:dish_id])

    dish_ingredients = @dish.dish_ingredients #DishIngredient.joins(:dish).where("dish.id = ?", @dish.id).destroy_all

    for  dish_ingredient in dish_ingredients
      dish_ingredient.destroy
    end

    @dish.destroy
    redirect_to "chefs/#{@chef.id}"
  end



end
