class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :dish
      t.decimal :price
      t.integer :portion      

      t.timestamps
    end
  end
end
