class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :cookbooks
  has_many :dishes, through: :cookbooks
end
