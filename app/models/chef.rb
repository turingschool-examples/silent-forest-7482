class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredient_list
    self.dishes.
    joins(:ingredients).
    where('ingredients.calories > 0').
    order(calories: :desc).
    select('ingredients.*').
    distinct
  end
end
