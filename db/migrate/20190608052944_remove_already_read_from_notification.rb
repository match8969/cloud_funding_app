class RemoveAlreadyReadFromNotification < ActiveRecord::Migration[5.1]
  def up
    remove_column :notifications, :already_read
  end

  def down
    remove_column :notifications, :already_read, :boolean
  end


end
