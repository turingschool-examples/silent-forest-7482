class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients_ordered_by_calories
    dishes.joins(:ingredients).select('ingredients.*').order('ingredients.calories DESC').distinct
  end

end
