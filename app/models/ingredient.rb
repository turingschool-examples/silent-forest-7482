class Ingredient < ApplicationRecord
  validates_presence_of :name
  belongs_to :dish

  def self.ordered_unique
    order(calories: :desc).distinct
  end
end
