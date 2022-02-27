class AddForeignKeysToRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_ingredients, :recipe_id, :foreign_key:index
    add_column :recipe_ingredients, :ingredient_id, :foreign_key:index
  end
end
