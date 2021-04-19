class CreateCookbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cookbooks do |t|
      t.references :ingredient, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
