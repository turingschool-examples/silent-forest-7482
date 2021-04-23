class ChefsController < ApplicationController

  def index
  end

  def show
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes
  end
end
