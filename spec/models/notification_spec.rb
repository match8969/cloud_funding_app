# == Schema Information
#
# Table name: notifications
#
#  id           :bigint(8)        not null, primary key
#  content      :string(255)
#  user_id      :bigint(8)
#  already_read :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
