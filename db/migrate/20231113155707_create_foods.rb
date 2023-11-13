class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :measurement_unit, default: 0
      t.decimal :price, default: 0
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
