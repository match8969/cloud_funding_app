# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  read_at    :datetime
#

class Notification < ApplicationRecord
  belongs_to :user
  scope :unread, -> { where(read_at: nil) }
end
