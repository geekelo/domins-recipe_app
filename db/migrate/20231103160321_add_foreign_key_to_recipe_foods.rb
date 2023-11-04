class AddForeignKeyToRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :recipe_foods, :recipes, on_delete: :cascade, name: 'fk_rails_b279eaba65'
  end
end
