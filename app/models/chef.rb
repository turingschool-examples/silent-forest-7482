class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    self.dishes
    .joins(:ingredients)
    .distinct
    .order(calories: :desc)
    .pluck("ingredients.name, calories")
    .to_h
  end

  def most_popular_ingredients
    binding.pry
    self.dishes.joins(:ingredients).group("ingredients.id").select("ingredients.*, count(ingredients) as times_used").order(times_used: :desc)
  end
end
