class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients_ordered_by_calories
    dishes.joins(:ingredients).select('ingredients.*').order('ingredients.calories DESC').distinct
  end

  def most_popular_ingredients
    dishes.joins(:dish_ingredients, :ingredients).order('dish_ingredients.dish_id DESC')
  end

end
