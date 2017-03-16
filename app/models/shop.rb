class Shop < ApplicationRecord
	has_many :dishes
	has_many :carts, through: :users
	has_many :users

	has_attached_file :logo,
                    styles: { medium: '300x300#', thumb: '100x100#'},
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :logo, 
                    content_type: ['image/jpeg', 'image/gif', 'image/png']

end
