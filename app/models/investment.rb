# == Schema Information
#
# Table name: investments
#
#  id         :bigint           not null, primary key
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#  product_id :bigint
#

class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
