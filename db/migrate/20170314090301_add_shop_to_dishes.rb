class AddShopToDishes < ActiveRecord::Migration[5.0]
  def change
    add_reference :dishes, :shop, foreign_key: true
  end
end
