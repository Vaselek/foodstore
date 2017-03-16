class AddCartToDishCarts < ActiveRecord::Migration[5.0]
  def change
    add_reference :dish_carts, :cart, foreign_key: true
  end
end
