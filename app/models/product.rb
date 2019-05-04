# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  goal_price    :integer
#  current_price :integer
#  due_date      :datetime
#  state         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class Product < ApplicationRecord
  belongs_to :user
  has_many :category, through: :product_category
  has_many :product_category
  validates :title, length: {maximum: 20, minimum: 1},
                     presence: true, uniqueness: { scope: :user_id } # ユーザー単位での重複したプロジェクト名を許可しない
  validates :description, length: {maximum: 100}, presence: true
  validates :goal_price, numericality: {greater_than: 0, less_than: 1000000000000}
  validates :current_price, numericality: {less_than: 1000000000000}
  
  # datetime型のvalidationの例が少ない。関数宣言してその関数をvalidate設定が良いのか?
  # validates :due_date, 
  enum state: {draft: 0, active: 1, archived: 2, unarchieved: 3, stop: 4}, _prefix: true  
  
  # Rails 4
  #bind_inum :state, ProductStates


end
