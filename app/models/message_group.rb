# == Schema Information
#
# Table name: message_groups
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MessageGroup < ApplicationRecord
  has_many :user_message_group, dependent: :destroy
  has_many :users, through: :user_message_group
  has_many :messages, dependent: :destroy
end
