class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column(:ingredients, :calories, :integer)
  end
end
