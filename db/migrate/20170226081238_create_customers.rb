class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.string :customer_address
      t.string :custormer_phone_number
      t.string :customer_hp_number
      t.integer :customer_postcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
