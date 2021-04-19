class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  # def most_popular_ingredients
  #   ingredients.group(:id).order("count(*) desc").limit(3)
  # end
end
