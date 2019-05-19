class UserMessageGroup < ApplicationRecord
    belongs_to :user
    belongs_to :message_group

    validates :user_id, uniqueness: { scope: :message_group_id, message: "Already have the message group." }
end
