class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.references :user
      t.string :shop_name
      t.string :shop_address
      t.integer :shop_postcode
      t.string :shop_state
      t.string :shop_phone
      t.string :shop_another_phone

      t.timestamps
    end
  end
end
