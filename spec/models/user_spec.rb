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
  # pending "add some examples to (or delete) #{__FILE__}"

  let!(:user) { FactoryBot.create(:user) }
  let!(:user_product) { FactoryBot.create(:product) }
  let!(:other_user) { FactoryBot.create(:user, :other_user) }
  let!(:other_product) { FactoryBot.create(:product, :other_product) }

  describe '#get_invested_product_owners' do
    let!(:user_investment) { FactoryBot.create(:investment) }
    let!(:owner) { FactoryBot.create(:user, :other_user) }

    context '投資した商品のオーナー場合' do
      it '結果が期待通りであること' do
        expect(user.get_invested_product_owners).to match_array([owner])
      end
    end

    context '投資していない商品のオーナー場合' do
      it '結果が期待通りであること' do
        expect(user.get_invested_product_owners).to_not match_array([user])
      end
    end
  end

  describe '#get_own_product_investors' do
    let!(:user_investment) { FactoryBot.create(:investment) }
    let!(:owner) { FactoryBot.create(:user, :other_user) }

    context '自分の商品の投資者の場合' do
      it '結果が期待通りであること' do
        expect(owner.get_own_product_investors).to match_array([user])
      end
    end

    context '自分の商品の投資者でない場合' do
      it '結果が期待通りであること' do
        expect(owner.get_own_product_investors).to_not match_array([owner])
      end
    end
  end

  describe '#sendable_users' do
    let!(:user_investment) { FactoryBot.create(:investment) }
    let!(:owner) { FactoryBot.create(:user, :other_user) }

    context '送信可能の場合' do
      context '投資した商品のオーナー場合' do
        it '結果が期待通りであること' do
          expect(user.sendable_users).to match_array([owner])
        end
      end
      context '自分の商品の投資者の場合' do
        it '結果が期待通りであること' do
          expect(owner.sendable_users).to match_array([user])
        end
      end
    end

    context '送信不可能の場合' do
      it '結果が期待通りであること' do
        expect(user.sendable_users).to_not match_array([user])
      end
    end
  end

  describe 'has_message_group_with?' do
    context 'メッセージグループが存在しない場合' do
      it '結果が期待通りであること' do
        expect(user.has_message_group_with?(other_user)).to be false
      end
    end

    context 'メッセージグループが存在する場合' do
      let!(:message_group) {
        user.message_groups.create
      }
      let!(:user_message_group) {
        UserMessageGroup.create(
          user_id: other_user.id,
          message_group_id: message_group.id
        )
      }
      it '結果が期待通りであること' do
        expect(user.has_message_group_with?(other_user)).to be true
      end
    end
  end
end
