# == Schema Information
#
# Table name: user_message_groups
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint
#  message_group_id :bigint
#

class UserMessageGroup < ApplicationRecord
    belongs_to :user
    belongs_to :message_group

    validates :user_id, uniqueness: { scope: :message_group_id, message: "Already have the message group." }
end
