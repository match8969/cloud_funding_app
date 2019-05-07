class AddUseridToProducts < ActiveRecord::Migration[5.1]
  def change
    # Foreign key 
    add_reference :products, :user, foreign_key: true
  end
end
