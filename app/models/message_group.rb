class MessageGroup < ApplicationRecord
  has_many :user_message_group, dependent: :destroy
  has_many :users, through: :user_message_group
  has_many :messages, dependent: :destroy
end
