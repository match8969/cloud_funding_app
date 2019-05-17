class CreateUserMessageGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_message_groups do |t|

      t.timestamps
    end
  end
end
