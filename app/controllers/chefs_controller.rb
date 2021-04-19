class ChefsController < ApplicationController
  def show
    @chef = Chef.find(chef_params[:id])
    @top_3_ingredients = Chef.top_3_ingredients
  end

  private

  def chef_params
    params.permit(:id, :name)
  end
end
