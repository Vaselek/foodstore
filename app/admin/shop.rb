ActiveAdmin.register Shop do

	sidebar "Dishes", only: [:show, :edit] do
		ul do 
			li link_to "Dishes", admin_shop_dishes_path(resource)
		end
	end

	index do
		selectable_column
		id_column
		column :image do |shop|
			image_tag shop.logo.url(:thumb)
		end
		column :title
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
