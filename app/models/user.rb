# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  address                :string(255)
#  role                   :integer
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable
         
  has_many :products, dependent: :destroy
  has_many :investments
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product
  has_many :user_message_group, dependent: :destroy
  has_many :message_groups, through: :user_message_group
  has_many :notifications, dependent: :destroy

  # role
  enum role: {general: 0, administer: 1}, _prefix: true

  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end

  def get_invested_product_owners
    User.where(id: Product.where(id: self.investments.pluck(:product_id)).pluck(:user_id))
  end

  def get_own_product_investors
    User.where(id: Investment.where(product_id: self.products.pluck(:id)).pluck(:user_id))
  end

  def sendable_users
    (get_invested_product_owners | get_own_product_investors)
  end

  def has_message_group_with?(user)
    # 積集合を確認
    !(self.message_groups & user.message_groups).empty?
  end

  def unread_notifications
    self.notifications.unread
  end
end
