class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  def ingredients_included
    ingredients =[]
    self.dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        ingredients.push(ingredient)
      end
    end
    ingredients.uniq
  end
end
