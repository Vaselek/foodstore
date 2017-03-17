ActiveAdmin.register Dish do

	permit_params :title, :description, :price, :shop, :image
	belongs_to :shop

	form do |f|
		f.input do
			f.input :title
			f.input :description
			f.input :price
			f.input :shop
			f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
		end
		f.actions
	end

	index do
		selectable_column
		id_column
		column :image do |dish|
			image_tag dish.image.url(:thumb)
		end
		column :title
		column :price
		column :shop
		actions
	end



# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
