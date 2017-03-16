class DishcartsController < ApplicationController

	def create
		dish = Dish.find(params[:dish_id])
		if DishCart.where(dish: dish).exist?
			@dish_cart = DishCart.where(dish: dish).first
			@dish_cart.portion += 1
			@dish_cart.save
		else
			@dish_cart_new = true
			@dish_cart = DishCart.create dish: dish, cart: current_user.cart, price: dish.price, portion: 1
		end
		respond_to do |format|
			format.html { redirect_to @dish }
			format.js {}
		end
	end

	def destroy
		DishCart.destroy(params[:id])

		respond_to do |format|
			format.html { redirect_to @dish }
			format.js {}
		end
	end

	def destroy_all
		@dish_carts = DishCart.all

		@dish_carts.each do |dish_cart|
			@dish_cart.destroy
		end

		respond_to do |format|
			format.html { redirect_to shop_path }
			format.js {}
		end
	end

	private

	def dish_cart_params
		params.require(:dish_cart).permit(:dish_id, :cart_id, :price, :portion)
	end

end
