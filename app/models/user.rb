class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	validates :name, presence: true, length: {maximum: 50}
	validates :address, presence: true, length: {maximum: 50}
	validates :phone, presence: true, length: {maximum: 50}
	
	
	has_many :carts
	has_many :shops, through: :carts
	has_many :orders
end

