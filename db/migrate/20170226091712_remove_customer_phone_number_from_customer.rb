class RemoveCustomerPhoneNumberFromCustomer < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :custormer_phone_number, :string
  end
end
