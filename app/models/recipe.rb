class Recipe < ApplicationRecord
  belongs_to :dish, dependent: :destroy
  belongs_to :ingredient
end
