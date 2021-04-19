class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  def ingredients_included_by_cal(chef_id)
    Ingredient.joins(:dishes).where('dishes.chef_id = ?', chef_id).order_by_cal.uniq
  end
end
