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

FactoryBot.define do
  factory :user_message_group do
    
  end
end
