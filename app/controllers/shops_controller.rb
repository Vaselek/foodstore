class ShopsController < ApplicationController
	
  def index
  	@shops = Shop.all
  end

  def show
  	@shop = Shop.find(params[:id])
  	@dishes = @shop.dishes
  end

end
