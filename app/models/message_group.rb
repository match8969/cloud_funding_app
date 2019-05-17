class MessageGroup < ApplicationRecord
  has_many :users, through: :user_message_group
  has_many :messages, dependent: :destroy
end
