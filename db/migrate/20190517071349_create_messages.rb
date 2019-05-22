class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :from_user_id
      t.references :message_group, foreign_key: true

      t.timestamps
    end
  end
end
