class DishesController < ApplicationController
  # def show
  #   @chef = Chef.find(params[:id])
  # end

  def destroy
    dish = Dish.find(params[:id])
    dish.destroy

    chef = Chef.find(params[:chef_id])
    # @chef = Chef.find(params[:chef_id])
    # @dish = Dish.find(params[:id])
    #
    # @dish.destroy

    redirect_to "/chefs/#{chef.id}"
  end
end
