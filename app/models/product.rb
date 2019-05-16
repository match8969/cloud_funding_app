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

class Product < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader, dependent: :destroy

  belongs_to :user
  has_many :product_category, dependent: :destroy
  has_many :categories, through: :product_category
  has_many :investments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :images, inverse_of: :product # check why inverse_of
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  validates :title, length: {maximum: 20, minimum: 1},
                     presence: true, uniqueness: { scope: :user_id } # ユーザー単位での重複したプロジェクト名を許可しない
  validates :description, length: {maximum: 100}, presence: true
  validates :goal_price, numericality: {greater_than: 0, less_than: 1000000000000}

  # state
  enum state: {draft: 0, active: 1, archived: 2, unarchieved: 3, stop: 4}, _prefix: true  
  
  # Rails 4
  #bind_inum :state, ProductStates

  def get_current_price
    current_price = 0
    investments = self.investments
    current_price = investments.pluck(:price).sum 
  end

  def investmentable?(investment = nil)
    return self.get_current_price <= self.goal_price if investment.blank?
    self.get_current_price + investment.price <= self.goal_price
  end

  def is_owned_by?(user_id)
    self.user_id == user_id
  end
end
