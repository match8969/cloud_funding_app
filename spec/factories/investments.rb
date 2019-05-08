# == Schema Information
#
# Table name: investments
#
#  id         :integer          not null, primary key
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  product_id :integer
#

FactoryBot.define do
  factory :investment do
    price { 1 }
  end
end
