# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :like do
    product { nil }
    user { nil }
  end
end
