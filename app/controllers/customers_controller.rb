class CustomersController < ApplicationController
	before_action :authenticate_user!

  def index
  	if user_signed_in?
	  	@user = current_user
	  	@customers = @user.customers.all
  	end
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
  		flash.now[:error] = 'Error'
  		render :new
  	end
  end

  def show
  	@user = current_user
  	@customer = @user.customers.find(params[:id])
  end

  def edit
  	@user = current_user
  	@customer = @user.customers.find(params[:id])
  end

  def update
  	@user = current_user
  	@customer = @user.customers.find(params[:id])

  	if @customer.update_attributes(customer_params)
  		flash.now[:success] = "Edit #{@customer.customer_name} is success"
  		redirect_to root_path
  	else
  		flash.now[:error] = "Unable to edit your user information"
  		render :new
  	end
  end

  def destroy
  	@user = current_user
  	@customer = @user.customers.find(params[:id])

  	@customer.destroy
  	flash.now[:success] = "#{@customer.id} is deleted"
  	redirect_to root_path
  end

  private

  def customer_params
  	params.require(:customer).permit(:user_id, :customer_name, :customer_address, :customer_phone_number, :customer_hp_number, :customer_postcode)
  end
end
