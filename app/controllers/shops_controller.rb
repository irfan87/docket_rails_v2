class ShopsController < ApplicationController
  def index
  	@shops = current_user.shops.all
  	
  	@shop if main_shop(current_user.shops.where(main_shop: true))
  end

	def new
		@shop = current_user.shops.build
	end

  def create
  	@shop = current_user.shops.build(shop_params)
  	
  	if @shop.save
  		flash[:success] = "You have created a new shop"
  		redirect_to root_path
  	else
  		flash.now[:error] = "Unable to create / save new shop"
  		render :new
  	end
  end
  
  def show
  	@main_shop = current_user.shops.find_by_main_shop(true)
  end

  private

  def shop_params
  	params.require(:shop).permit(:user_id, :shop_name, :shop_address, :shop_postcode, :shop_state, :shop_phone, :shop_another_phone, :main_shop)
  end
end
