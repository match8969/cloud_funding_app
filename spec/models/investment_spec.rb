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

require 'rails_helper'

RSpec.describe Investment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
