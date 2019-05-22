class CreateMessageGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :message_groups do |t|

      t.timestamps
    end
  end
end
