class AddUserIdProductIdToInvestment < ActiveRecord::Migration[5.1]
  def change
    add_reference :investments, :user, foreign_key: true
    add_reference :investments, :product, foreign_key: true
  end
end
