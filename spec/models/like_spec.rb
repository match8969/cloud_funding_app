# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  product_id :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Like, type: :model do

  let!(:like_from_other_user) { FactoryBot.create(:like, :from_other_user)}

  describe '#send_notification_to_owner' do
    it '結果が期待通りであること' do
      expect do
        like_from_other_user.send_notification_to_owner
      end.to change(Notification, :count).by(1)
    end
  end
  
end
