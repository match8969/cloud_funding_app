# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint           not null, primary key
#  product_id  :bigint
#  category_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
