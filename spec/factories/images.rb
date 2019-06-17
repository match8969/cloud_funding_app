# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#

FactoryBot.define do
  factory :image do
    image { "MyString" }
  end
end
