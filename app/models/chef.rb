class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    self.dishes.joins(:ingredients).distinct.order(calories: :desc).pluck("ingredients.name, calories").to_h
  end
end
