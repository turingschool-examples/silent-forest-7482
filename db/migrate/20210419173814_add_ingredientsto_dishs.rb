class AddIngredientstoDishs < ActiveRecord::Migration[5.2]
  def change
    add_reference :ingredient, :dish, foreign_key: true
  end
end
