class DocketsController < ApplicationController
  def new
  	@docket = Docket.new
  end
  
  def create
  	@shops_array = current_user.shops.all.map { |shop| [shop.user_id, shop.shop_name, shop.id]}
  	@docket = current_user.dockets.build(docket_params)
  	
  	if @docket.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end
  
  private
  
  def docket_params
  	params.require(:docket).permit(:user_id, :cust_name, :cust_address, :cust_postcode, :cust_phone)
  end
end
