# == Schema Information
#
# Table name: messages
#
#  id               :bigint           not null, primary key
#  content          :string(255)
#  from_user_id     :integer
#  message_group_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :message_group

  validates :content, presence: true
end
