class CreateDishCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :dish_carts do |t|
      t.references :dish, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :price
      t.integer :portion

      t.timestamps
    end
  end
end
