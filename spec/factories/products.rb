# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  title       :string(255)
#  description :text(65535)
#  goal_price  :integer
#  due_date    :datetime
#  state       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#  thumbnail   :string(255)
#

FactoryBot.define do
  factory :product do
    title {"product1 title"}
    description {"product1 description"}
    goal_price {1000000}
    due_date {Time.zone.now + 2.month}
    state {:draft}
    initialize_with { Product.find_or_create_by(title: title)}
    association :user, factory: :user

    trait :other_product do
      title {"other_product title"}
      description {"other_product description"}
      association :user, factory: [:user, :other_user]
    end

    trait :new_product do
      title {"new_product title"}
    end
  end
end
