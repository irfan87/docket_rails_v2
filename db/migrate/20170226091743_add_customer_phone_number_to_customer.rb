class AddCustomerPhoneNumberToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :customer_phone_number, :string
  end
end
