# == Schema Information
#
# Table name: product_categories
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :product_category do
    product { nil }
    category { nil }
  end
end
