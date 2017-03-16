class RemoveUserFromDishCarts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :dish_carts, :user, foreign_key: true
  end
end
