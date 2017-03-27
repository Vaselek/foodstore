ActiveAdmin.register OrderItem do
 
  config.clear_action_items!
  
	belongs_to :order

	# form do |f|
	# 	f.inputs do
	# 		f.input :order, :as => :select, collection => Order.all.collect { |order| [order.id, order.id] }
	# 		f.input :dish, :as => :select, collection => Dish.all.collect { |dish| [dish.title, dish.id] }
	# 	end
	# 	f.actions
	# end


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
