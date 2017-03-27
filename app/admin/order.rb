ActiveAdmin.register Order do

	permit_params :shop_id, :user_id
	
	config.clear_action_items!
	
	
	sidebar "Order Items", only: [:show, :edit] do
		ul do 
			li link_to "Items in Order", admin_order_order_items_path(resource)
		end
	end

	form do |f|
		f.inputs do
			f.input :user, :as => :select, collection => User.all.collect { |user| [user.name, user.id] }
			f.input :shop, :as => :select, collection => Shop.all.collect { |shop| [shop.title, shop.id] }
		end
		f.actions
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
