class ChefsController < ApplicationController
  def show
    @chef = Chef.find(chef_params[:id])
  end

  private

  def chef_params
    params.permit(:id, :name)
  end
end
