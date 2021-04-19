class Ingredient < ApplicationRecord
  has_many :recipes
  has_many :dishes, through: :recipes
  has_many :chefs, through: :dishes

  # def self.popular_ingredients_by_chef(chef_id)
  #   joins(:chefs)
  #   .select('ingredients.*, count(ingredients.id) as ingredient_count')
  #   .where(chefs: {id: chef_id})
  #   .group('ingredients.id')
  #   .order(ingredient_count: :desc)
  #   .limit(3)
  # end
end
