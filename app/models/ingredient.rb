class Ingredient < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_many :dishes, through: :recipes
end
