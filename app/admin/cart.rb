ActiveAdmin.register Cart do

	sidebar "Cart Content", only: [:show, :edit] do
		ul do 
			li link_to "Dishes in Cart", admin_cart_dish_carts_path(resource)
		end
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
