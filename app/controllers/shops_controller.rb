class ShopsController < ApplicationController
  def index
  	@shops = current_user.shops.all
  end

	def new
		@shop = current_user.shops.build
	end

  def create
  	@shop = current_user.shops.build(shop_params)
  	
  	if @shop.save
  		flash[:success] = "You have created a new shop"
	  	redirect_to user_shops_path(current_user)
  	else
  		flash.now[:error] = "Unable to create / save new shop"
  		render :new
  	end
  end
  
  def show
  	@shop = current_user.shops.find(params[:id])
  end
  
  def edit
  	@shop = current_user.shops.find(params[:id])
  end
  
  def update
  	@shop = current_user.shops.find(params[:id])
  	if @shop.update(shop_params)
  		flash[:success] = 'Update Success'
	  	redirect_to user_shops_path(current_user)
  	else
  		flash[:danger] = 'Unable to update'
  		render :edit
  	end
  end
  
  def destroy
  	@shop = current_user.shop.find(params[:id])
  	@shop.destroy
  	
  	flash.now[:success] = 'One shop have been deleted'
  	
  	redirect_to user_shops_path(current_user)
  end

  private

  def shop_params
  	params.require(:shop).permit(:user_id, :shop_name, :shop_address, :shop_postcode, :shop_state, :shop_phone, :shop_another_phone)
  end
end
