class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.datetime :preparation_time
      t.time :cooking_time
      t.text :description
      t.boolean :public

      t.timestamps
    end
    add_reference :recipes, :user, null: false, foreign_key: true
  end
end
