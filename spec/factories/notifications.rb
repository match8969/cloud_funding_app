# == Schema Information
#
# Table name: notifications
#
#  id           :bigint(8)        not null, primary key
#  content      :string(255)
#  user_id      :bigint(8)
#  already_read :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :notification do
    content { "MyString" }
    to_user_id { 1 }
    already_read { false }
  end
end
