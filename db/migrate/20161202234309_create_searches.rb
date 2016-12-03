class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :meal_type
      t.string :ingredients
      t.string :cuisine_type

      t.timestamps
    end
  end
end
