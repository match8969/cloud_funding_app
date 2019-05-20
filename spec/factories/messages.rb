# == Schema Information
#
# Table name: messages
#
#  id               :integer          not null, primary key
#  content          :string
#  from_user_id     :integer
#  message_group_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :message do
    content { "MyString" }
    from_user_id { 1 }
    message_group { nil }
  end
end
