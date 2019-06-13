# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  product_id :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  after_commit :send_notification_to_owner, on: [:create]
  belongs_to :product
  belongs_to :user
  # 1ユーザーに対して1いいねのみ許可
  validates_uniqueness_of :product_id, scope: :user_id

  def send_notification_to_owner
    deliver_result = UserMailer.with(to_user: self.product.user, from_user: self.user, product: self.product)
                 .send_like_notification.deliver_now
    unless deliver_result.nil?
      # メール送信に問題がなければnotificationをデータベースに保存
      self.product.user.notifications.create(content: "#{self.user.name}さんが#{self.product.title}に「いいね」をしました。")
    end

  end

end
