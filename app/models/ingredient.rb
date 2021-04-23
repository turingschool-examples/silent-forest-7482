class Ingredient < ApplicationRecord
  validates_presence_of :name
  belongs_to :dish
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients


  def self.ordered_unique
    select(:name, :calories)
    .order(calories: :desc).distinct
  end
end
