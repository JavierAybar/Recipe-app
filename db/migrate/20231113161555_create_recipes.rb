class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time, default: 0
      t.integer :cooking_time, default: 0
      t.text :description
      t.boolean :public

      t.timestamps
    end
    add_reference :recipes, :user, null: false, foreign_key: true
  end
end
