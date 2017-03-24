class DishCartsController < ApplicationController

	def create
		dish = Dish.find(params[:dish_id])
		@cart = current_user.carts.where(shop: dish.shop).first
		if DishCart.where(dish: dish, cart: @cart).exists?
			@dish_cart = DishCart.where(dish: dish, cart: @cart).first
			@dish_cart.portion += 1
			@dish_cart.save
		else
			@dish_cart_new = true
			@dish_cart = DishCart.create dish: dish, cart: @cart, price: dish.price, portion: 1
		end
		respond_to do |format|
			format.html { redirect_to :back }
			format.js {}
		end
	end

	def destroy
		@dish_cart = DishCart.find(params[:id])
		@cart = @dish_cart.cart

		@dish_cart.destroy

		respond_to do |format|
			format.html { redirect_to @dish }
			format.js {}
		end
	end

	private

	def dish_cart_params
		params.require(:dish_cart).permit(:dish_id, :cart_id, :price, :portion)
	end

end
