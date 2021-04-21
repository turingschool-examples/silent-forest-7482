class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :cookbooks
  has_many :ingredients, through: :cookbooks
end
