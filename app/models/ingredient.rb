class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :cookbooks
  has_many :dishes, through: :cookbooks

  def self.unique_ingredients_ordered_from_highest_calories
    order("calories DESC").pluck(:name).distinct
  end
end
