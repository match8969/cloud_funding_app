# == Schema Information
#
# Table name: investments
#
#  id         :bigint(8)        not null, primary key
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  product_id :bigint(8)
#

FactoryBot.define do
  factory :investment do
    # user -> other_user product
    price { 1 }
    product_id { FactoryBot.create(:product, :other_product).id }
    association :user, factory: :user
    association :product, factory: [:product, :other_product]

    # other user -> user product
    trait :other_investment do
      product_id { FactoryBot.create(:product).id }
      association :user, factory: [:user, :other_user]
      association :product, factory: :product
    end
  end
end
