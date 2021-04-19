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

  def self.most_popular(chef)
    #### this doesn't actually work 😅
    joins(:dish, :ingredient)
    .select("ingredients.*")
    .where("dishes.chef_id = ?", chef.id)
    .limit(3)
    .distinct
  end
end
