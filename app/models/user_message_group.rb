# == Schema Information
#
# Table name: user_message_groups
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  message_group_id :integer
#

class UserMessageGroup < ApplicationRecord
    belongs_to :user
    belongs_to :message_group

    validates :user_id, uniqueness: { scope: :message_group_id, message: "Already have the message group." }
end
