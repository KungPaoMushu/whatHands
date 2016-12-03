class Search < ApplicationRecord
def search_recipes
    
    recipes = Recipe.all

    recipes = recipes.where(["title LIKE ?", "%#{keywords}%" ]) if keywords.present?
    recipes = recipes.where(["meal_type LIKE ?", meal_type ]) if meal_type.present?
    recipes = recipes.where(["cuisine_type LIKE ?", cuisine_type ]) if cuisine_type.present?
    ingredients = ingredient.where(["ingredient ?", ingredients.name ]) if ingredients.present?

    return recipes
  end

end