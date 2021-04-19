class DishesController < ApplicationController
    def destroy
      DishesIngredient.where("dish_id = ?", dish_params[:id]).first.destroy
      Dish.find(dish_params[:id]).destroy
      chef = Chef.where("id = ?", params[:chef_id])

      redirect_to "/chefs/#{chef.first.id}"
    end

  private

  def dish_params
    params.permit(:id, :name, :description)
  end
end
