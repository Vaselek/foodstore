class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :dish_carts


  def total_price
  	dish_carts.sum { |p| p.price * p.portion }
  end

  

end



