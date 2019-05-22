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

FactoryBot.define do
  factory :user_message_group do
    
  end
end
