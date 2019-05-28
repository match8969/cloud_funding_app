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

    # user_id { FactoryBot.create(:user, :other_user).id }
    # product_id { FactoryBot.create(:product).id }

    trait :from_other_user do
      user_id { FactoryBot.create(:user, :other_user).id }
      product_id { FactoryBot.create(:product, :new_product).id }
      association :user, factory: [:user, :other_user]
      association :product, factory: [:product, :new_product]
    end

  end
end
