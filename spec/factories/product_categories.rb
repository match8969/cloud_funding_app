# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint(8)        not null, primary key
#  product_id  :bigint(8)
#  category_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :product_category do
    product { nil }
    category { nil }
  end
end
