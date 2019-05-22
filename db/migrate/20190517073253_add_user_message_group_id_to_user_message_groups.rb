class AddUserMessageGroupIdToUserMessageGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_message_groups, :user, foreign_key: true
    add_reference :user_message_groups, :message_group, foreign_key: true
  end
end
