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
  validates :title, length: {maximum: 20}, presence: true
  validates :description, length: {maximum: 100}, presence: true
end
