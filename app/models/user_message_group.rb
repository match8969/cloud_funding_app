# == Schema Information
#
# Table name: user_message_groups
#
#  id               :bigint(8)        not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
#  message_group_id :bigint(8)
#

class UserMessageGroup < ApplicationRecord
    belongs_to :user
    belongs_to :message_group

    validates :user_id, uniqueness: { scope: :message_group_id, message: "Already have the message group." }
end
