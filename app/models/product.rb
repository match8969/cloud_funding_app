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
  validates :title, length: {maximum: 20, minimum: 1},
                     presence: true, uniqueness: { scope: :user_id }
  validates :description, length: {maximum: 100}, presence: true
  validates :goal_price, numericality: {greater_than: 0, less_than: 1000000000000}
  validates :current_price, numericality: {less_than: 1000000000000}



end
