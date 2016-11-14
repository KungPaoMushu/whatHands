class AddColumnCuisineToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :cuisine_type, :string
  end
end
