# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint(8)        not null, primary key
#  product_id  :bigint(8)
#  category_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
