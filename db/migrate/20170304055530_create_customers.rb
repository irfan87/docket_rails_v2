class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.references :user, foreign_key: true
      t.string :cust_name
      t.text :cust_address
      t.string :cust_postcode
      t.string :cust_phone

      t.timestamps
    end
  end
end
