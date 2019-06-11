# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#

require 'rails_helper'

RSpec.describe Image, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
