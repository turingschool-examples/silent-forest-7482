class Ingredient < ApplicationRecord
  default_scope { order(calories: :desc) }

  has_and_belongs_to_many :dishes
end
