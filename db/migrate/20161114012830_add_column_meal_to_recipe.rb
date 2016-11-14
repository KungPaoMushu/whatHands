class AddColumnMealToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :meal_type, :string
  end
end
