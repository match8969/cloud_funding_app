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
  after_create :send_notification_to_owner
  belongs_to :product
  belongs_to :user
  # 1ユーザーに対して1いいねのみ許可
  validates_uniqueness_of :product_id, scope: :user_id

  def send_notification_to_owner
    UserMailer.with(to_user: self.product.user, from_user: self.user, product: self.product)
        .send_like_notification.deliver_now
  end

end
