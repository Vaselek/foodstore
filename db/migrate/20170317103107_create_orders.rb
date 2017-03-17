class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.decimal :total_price

      t.timestamps
    end
  end
end
