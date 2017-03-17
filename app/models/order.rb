class Order < ApplicationRecord
	has_many :order_items
	belongs_to :shop
  belongs_to :user

  def self.date_total(date)
  	self.where(created_at: date.beginning_of_day..date.end_of_day).sum(:total_price)
  end

  Order.date_total(Date.today).to_f


end
