class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @dishs = @chef.dishs
  end

  def destroy

  end
end
