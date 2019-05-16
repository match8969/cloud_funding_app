class AddProductIdToImages < ActiveRecord::Migration[5.1]
  def change
    # Foreign key 
    add_reference :images, :product, foreign_key: true
  end
end
