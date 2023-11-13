class CreateRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity, default: 0

      t.timestamps
    end
    add_reference :recipe_foods, :recipe, null: false, foreign_key: true
    add_reference :recipe_foods, :food, null: false, foreign_key: true
  end
end
