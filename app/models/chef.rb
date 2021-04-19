class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes



  def chef_ingredients
    Ingredient.joins(dish_ingredients: {dish: :chef})
      .where("chefs.id = ?", self.id)
      .order(:calories).uniq
      # .group('ingredient.id')
  end

  
end
