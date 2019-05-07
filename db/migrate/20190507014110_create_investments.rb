class CreateInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :investments do |t|
      t.integer :price

      t.timestamps
    end
  end
end
