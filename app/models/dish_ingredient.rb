class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient

  def self.chef_ingredients(chef)
    joins(:dish, :ingredient)
    .select("ingredients.*")
    .where("dishes.chef_id = ?", chef.id)
    .order(calories: :desc)
    .distinct
  end
end
