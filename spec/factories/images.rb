# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#

FactoryBot.define do
  factory :image do
    image { "MyString" }
  end
end
