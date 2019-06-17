# == Schema Information
#
# Table name: user_message_groups
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint
#  message_group_id :bigint
#

require 'rails_helper'

RSpec.describe UserMessageGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
