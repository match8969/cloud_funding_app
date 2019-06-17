# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  title       :string(255)
#  description :text(65535)
#  goal_price  :integer
#  due_date    :datetime
#  state       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#  thumbnail   :string(255)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
