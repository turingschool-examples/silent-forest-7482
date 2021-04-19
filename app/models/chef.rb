class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :recipes, through: :dishes
  has_many :ingredients, through: :recipes

  def uniq_ingredients
    ingredients.order(calories: :desc).uniq
  end

#Most popular
  def top_3_ingredients
    ingredients
    .select("ingredients.*, count(ingredients) as ingredient_count")
    .group(:id)
    .order(ingredient_count: :desc)
    .limit(3)
  end

end
