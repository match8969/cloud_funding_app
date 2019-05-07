class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :goal_price
      t.integer :current_price, default: 0
      t.datetime :due_date
      t.integer :state

      t.timestamps
    end
  end
end
