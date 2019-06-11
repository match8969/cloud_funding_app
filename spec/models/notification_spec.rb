# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  read_at    :datetime
#

require 'rails_helper'

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
