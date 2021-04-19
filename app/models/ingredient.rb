class Ingredient <ApplicationRecord
  validates_presence_of :name, :calories
  has_many :recipes
  has_many :dishes, through: :recipes

  def self.ingredients_used
    order(calories: :desc)
    .select('ingredients.*')
    .distinct
  end
end
