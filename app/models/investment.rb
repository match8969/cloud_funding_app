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

class Investment < ApplicationRecord
  belongs_to :user
end
