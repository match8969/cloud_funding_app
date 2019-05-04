# == Schema Information
#
# Table name: investments
#
#  id         :integer          not null, primary key
#  price      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Investment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
