# == Schema Information
#
# Table name: messages
#
#  id               :bigint(8)        not null, primary key
#  content          :string(255)
#  from_user_id     :integer
#  message_group_id :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
