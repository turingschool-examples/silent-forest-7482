class Ingredient < ApplicationRecord
  default_scope { order(calories: :desc) }
  
  has_many :dish_ingredients, dependent: :destroy
  has_many :dishes, through: :dish_ingredients

  validates :name, presence: true
  validates :calories, presence: true, numericality: true

  def self.ingredients_by_chef(chef)
    joins(:dishes)
    .distinct
    .where('dishes.chef_id = ?', chef.id)
  end
end
