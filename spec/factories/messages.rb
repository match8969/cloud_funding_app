FactoryBot.define do
  factory :message do
    content { "MyString" }
    from_user_id { 1 }
    message_group { nil }
  end
end
