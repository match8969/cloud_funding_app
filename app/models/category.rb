# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
    has_many :product, through: :product_category
    has_many :product_category

    # 他のモデルを一括で更新、保存できるようにする
    accepts_nested_attributes_for :product_category

    # # TODO
    # validates :name, presence: true
end
