class RemoveMainShopFromShop < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :main_shop, :boolean
  end
end
