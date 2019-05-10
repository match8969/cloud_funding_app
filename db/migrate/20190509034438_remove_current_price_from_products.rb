class RemoveCurrentPriceFromProducts < ActiveRecord::Migration[5.1]
  def up
    remove_column :products, :current_price
  end

  def down
    add_column :products, :current_price, :integer
  end
end