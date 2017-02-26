class ShopsController < ApplicationController
  def index
  	@shops = current_user.shops.all
  end

  def create
  end

  private

  def shop_params
  	params.require(:shop).permit(:user_id, :shop_name, :shop_address, :shop_postcode, :shop_state, :shop_phone, :shop_another_phone)
  end
end
