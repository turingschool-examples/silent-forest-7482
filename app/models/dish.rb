class Dish < ApplicationRecord
  has_and_belongs_to_many :ingredients
  validates_presence_of :name, :description
  belongs_to :chef, optional: true
end
