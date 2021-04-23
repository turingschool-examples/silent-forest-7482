class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :recipes,  dependent: :destroy
  has_many :ingredients, through: :recipes
end
