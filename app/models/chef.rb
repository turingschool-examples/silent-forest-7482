class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes, dependent: :destroy

  def ingredient_calories_list
    self.dishes.joins(:ingredients)
    .select("ingredients.*")
    .order('calories DESC')
    .distinct
    .pluck("ingredients.name, calories").flatten
  end
end
