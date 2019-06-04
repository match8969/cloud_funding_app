class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :content
      t.references :user, index: true
      t.boolean :already_read, :default => false

      t.timestamps
    end
  end
end
