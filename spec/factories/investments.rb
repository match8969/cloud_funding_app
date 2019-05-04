# == Schema Information
#
# Table name: investments
#
#  id         :integer          not null, primary key
#  price      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :investment do
    price { 1 }
    user { nil }
  end
end
