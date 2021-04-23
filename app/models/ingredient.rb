class Ingredient <ApplicationRecord

  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.ingredients_included_by_cal(chef_id)
    self.joins(:dishes).where('dishes.chef_id = ?', chef_id).order(calories: :desc).uniq
  end
end
