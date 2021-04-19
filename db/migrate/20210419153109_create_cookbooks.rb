class CreateCookbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cookbooks do |t|
      t.references :ingredients, foreign_key: true
      t.references :dishes, foreign_key: true
    end
  end
end
