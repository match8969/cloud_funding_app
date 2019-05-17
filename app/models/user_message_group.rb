class UserMessageGroup < ApplicationRecord
    belongs_to :user
    belongs_to :message_group
end
