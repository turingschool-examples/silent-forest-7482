class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def self.unique_ingredients_ordered_from_highest_calories
    Chef.joins(:dishes, :ingredients)
  end
end
