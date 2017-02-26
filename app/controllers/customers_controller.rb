class CustomersController < ApplicationController
  def index
  	@user = current_user
  	@customers = @user.customers.all
  end

  def new
  	@user = current_user
  	@customer = @user.customers.new
  end

  def create
  	@user = current_user
  	@customer = @user.customers.build(customer_params)

  	if @customer.save
  		flash.now[:success] = 'Success!'
  		redirect_to root_path
  	else
  		flash.now[:danger] = 'Error'
  		render :new
  	end
  end

  def show
  	@user = current_user
  	@customer = @user.customers.find(params[:id])
  end

  private

  def customer_params
  	params.require(:customer).permit(:user_id, :customer_name, :customer_address, :customer_phone_number, :customer_hp_number, :customer_postcode)
  end
end
