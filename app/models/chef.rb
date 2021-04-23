class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients_ordered_by_calories
    Ingredient.joins(:dish_ingredients, :ingredients)
    .group(:id)
    .order(calories: :desc)
    .limit(1)
  end
end
