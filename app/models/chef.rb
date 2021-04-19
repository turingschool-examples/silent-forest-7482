class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def uniq_ingredients_calories_descending
    dishes.joins(:ingredients)
      .select("ingredients.*")
      .distinct
      .order("calories desc")
  end
end
