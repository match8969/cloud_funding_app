# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  product_id :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :like do

    trait :from_other_user do
      user_id { FactoryBot.create(:user, :other_user).id }
      product_id { FactoryBot.create(:product, :new_product).id }
      association :user, factory: [:user, :other_user]
      association :product, factory: [:product, :new_product]
    end

  end
end
