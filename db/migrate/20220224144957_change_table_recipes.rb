class ChangeTableRecipes < ActiveRecord::Migration[6.1]
  def change
    change_table :recipes do |t|
      
      t.references :ingredients, index: true, foreign_key: true
    end
  end
end

