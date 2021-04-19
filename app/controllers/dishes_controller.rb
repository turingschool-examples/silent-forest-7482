class DishesController < ApplicationController
  # def show
  #   @chef = Chef.find(params[:id])
  # end

  def destroy
    # binding.pry
   chef = Chef.find(params[:chef_id])
   dish = Dish.find(params[:id])
   dish.destroy



    redirect_to "/chefs/#{chef.id}"
  end
end
