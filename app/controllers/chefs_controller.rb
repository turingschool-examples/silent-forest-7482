class ChefsController < ApplicationController
  def show
    @chef = Chef.find(chef_params[:id])
  end

  def update
    # pet = Pet.find(params[:id])
    # if pet.update(pet_params)
    #   redirect_to show page route
    # else
      #string interpolate here; can't because of snippet
      # redirect_to "/pets/pet.id/edit",
      #alert: "Error: string interpolate hashtag error_message(merchant.errors)
    # end
  end

  private

  def chef_params
    params.permit(:id, :name)
  end
end
