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
    # user -> other_user product
    price { 1 }
    association :user, factory: :user
    association :product, factory: [:product, :other_product]

    # other user -> user product
    trait :other_investment do
      association :user, factory: [:user, :other_user]
      association :product, factory: :product
    end
  end
end
