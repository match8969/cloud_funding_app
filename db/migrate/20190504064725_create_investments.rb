class CreateInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :investments do |t|
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
