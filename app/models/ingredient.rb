class Ingredient <ApplicationRecord
  validates_presence_of :name, :calories
  has_many :recipes
  has_many :dishes, through: :recipes

  def self.ingredients_used
    select(:name).distinct
    order(calories: :desc)
  end
end
