class DishesController < ApplicationController

  def destroy
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes.destroy
    redirect_to "/chefs/#{@chef.id}"
  end
end
