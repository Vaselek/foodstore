class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :dish_carts
end
