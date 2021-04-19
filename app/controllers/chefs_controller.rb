class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def destroy
    @chef = Chef.find(params[:id])
    dish = Dish.find(params[:id])

    dish.destroy
    redirect_to "/chefs/#{@chef.id}"
  end
end
