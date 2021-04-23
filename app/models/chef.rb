class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def ingredient_names_and_calories
    ingredients.distinct
    .order('ingredients.calories desc')
    .pluck(:name, :calories)
    .flatten
  end

  def self.top_3_ingredients
    joins(dishes: :ingredients)
    .group(:dish_name)
    .order('count(*)')
    .select('count(*) as ingredient_cnt, ingredients.*')
  end
end
