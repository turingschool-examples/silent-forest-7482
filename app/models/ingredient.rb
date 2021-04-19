class Ingredient < ApplicationRecord
  has_many :recipes
  has_many :dishes, through: :recipes
  has_many :chefs, through: :dishes
end
