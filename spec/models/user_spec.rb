# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  address                :string
#  role                   :integer
#

require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#is_administer?' do
    context '運営管理者の場合' do
      let!(:administer) { FactoryBot.create(:user, :administer_user)}
      it '結果が期待通りであること' do
        expect(administer.is_administer?).to be true
      end
    end

    context '一般ユーザーの場合' do
      let!(:general_user) { FactoryBot.create(:user)}
      it '結果が期待通りであること' do
        expect(general_user.is_administer?).to be false
      end
    end


  end

end
