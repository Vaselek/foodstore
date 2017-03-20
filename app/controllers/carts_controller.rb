class CartsController < ApplicationController
	before_action :set_cart, only: [:show, :edit, :update, :destroy]
  
  
  def index
  	@carts = Cart.all
  end

  def show
  end

  def new 
  	@cart = Cart.new
  end

  def edit
  end

  def create
  	@shop = Shop.find(parmas[:shop_id])
  	@cart = @shop.carts.create(cart_params)
    @cart.user_id = current_user
  	respond_to do |format|
  		if @cart.save
  			format.html { redirect_to @cart, notice: 'Cart was successfully created!'}
  			format.json { render :show, status: :created, location: @cart }
  		else
  			format.html { render :new }
  			format.json { render json @cart.errors, status: :unprocessable_entity }
  		end
  	end
  end

  # def update
  # 	respond_to do |format|
  # 		if @cart.update(cart_params)
  # 			format.html { redirect_to @cart, notice: 'Cart was successfully updated!' }
  # 			format.json { render :show, status: :ok, location: @cart }
  # 		else
  # 			format.html { render :edit }
  # 			format.json { render json: @cart.errors, status: :unprocessable_entity }
  # 		end
  # 	end
  # end

  def destroy
  	@cart = Cart.find(params[:id])
    order = Order.create(user: @cart.user, shop: @cart.shop, total_price: @cart.dish_carts.sum { |p| p.price * p.portion })
    @cart.dish_carts.each do |dish_cart|
      OrderItem.create(order: order, 
                       dish_id: dish_cart.dish.id, 
                       price: dish_cart.price, 
                       portion: dish_cart.portion)      
    end
    
    @cart.dish_carts.destroy_all
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Заказ отправлен, корзина очищена' }
      format.json { head :no_content }
    end
  end

  

  private

  def set_cart
  	@cart = Cart.find(params[:id])
  end

  def cart_params
  	params.require(:cart).permit(:user_id, :shop_id)
  end
 
end


