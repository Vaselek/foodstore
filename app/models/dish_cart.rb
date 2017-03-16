class DishCart < ApplicationRecord
  belongs_to :dish
  belongs_to :cart
end
