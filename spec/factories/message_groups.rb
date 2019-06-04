# == Schema Information
#
# Table name: message_groups
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :message_group do
    trait :other_user_ids do
      user_ids {[FactoryBot.create(:user, :other_user).id]}
    end

  end
end
