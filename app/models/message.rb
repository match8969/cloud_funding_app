# == Schema Information
#
# Table name: messages
#
#  id               :integer          not null, primary key
#  content          :string
#  from_user_id     :integer
#  message_group_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :message_group

  validates :content, presence: true
end
