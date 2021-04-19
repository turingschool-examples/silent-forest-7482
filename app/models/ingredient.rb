class Ingredient <ApplicationRecord

  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.order_by_cal
    self.order(calories: :desc)
  end
end
