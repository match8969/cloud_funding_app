# == Schema Information
#
# Table name: messages
#
#  id               :bigint(8)        not null, primary key
#  content          :string(255)
#  from_user_id     :integer
#  message_group_id :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :message do
    content { "message1 content" }
    from_user_id { FactoryBot.create(:user).id }
    message_group_id { FactoryBot.create(:message_group, :other_user_ids).id }
  end
end
