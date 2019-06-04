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

FactoryBot.define do
  factory :user_message_group do
    
  end
end
