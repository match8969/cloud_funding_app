# == Schema Information
#
# Table name: likes
#
#  id         :bigint(8)        not null, primary key
#  product_id :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  belongs_to :product
  belongs_to :user
  # 1ユーザーに対して1いいねのみ許可
  validates_uniqueness_of :product_id, scope: :user_id
end
