class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    # if params[:search].present?
    #   @actor = Actor.search(params[:search])
    # end
  end
  #
  # def update
  #   @movie = Movie.find(params[:id])
  #   if params[:search].present?
  #     @actor = Actor.search(params[:search])
  #     MovieActor.create(movie: @movie, actor: @actor[0])
  #   end
  #   render :show
  # end
end
