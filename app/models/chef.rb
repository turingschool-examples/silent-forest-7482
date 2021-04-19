class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients_for_show
    #self.dishes.joins(:ingredients).select('ingredients.name').order(calories: :desc)
    self.dishes.joins(:ingredients).select('ingredients.name', 'ingredients.calories').order(calories: :desc).distinct(:name)
  end
end
