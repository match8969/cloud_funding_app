# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  goal_price  :integer
#  due_date    :datetime
#  state       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

FactoryBot.define do
  factory :product do
    title {"product1 title"}
    description {"product1 description"}
    goal_price {1000000}
    due_date {Time.zone.now + 2.month}
    state {:draft}
    association :user, factory: :user
  end
end
