class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def uniq_ingredients_calories_descending
    dishes.joins(:ingredients)
      .select("ingredients.*")
      .distinct
      .order("calories desc")
  end

  def most_popular_ingredients
    ingredients.select('ingredients.*, count(ingredients.id) as ingredient_count')
      .group(:id)
      .order('ingredient_count desc')
      .limit(3)

    # dishes.joins(:ingredients, :dish_ingredients)
    # .select("ingredients.*, count(ingredient.id) as ingredient_count")
    # .order(ingredient_count: :desc)
    # .limit(3)
  end
end
