class AddUserIdToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :user_id, :integer
    add_index :ingredients, :user_id
  end
end
