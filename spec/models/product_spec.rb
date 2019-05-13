# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  goal_price  :integer
#  due_date    :datetime
#  state       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  # 遅延読み込み
  let!(:owner) { FactoryBot.create(:user) }
  let!(:user) { FactoryBot.create(:user, :other_user) }

  describe '#get_current_price' do
    let!(:product) { FactoryBot.create(:product) }

    context '値が取得できる場合' do
      let!(:investment) {
        product.investments.create(
          price: 100,
          user_id: user.id
        )
      }
      it '結果が期待通りであること' do
        expect(product.get_current_price).to eq(investment.price)
      end
    end
  end

  describe '#investmentable?' do
    let!(:product) { FactoryBot.create(:product) }

    context '引数をもたない場合' do
      context '目標金額以下場合' do
        let!(:investment) {
          product.investments.create(
            price: 1000000,
            user_id: user.id
          )
        }
        it '結果が期待通りであること' do
          expect(product.investmentable?).to be true
        end
      end

      context '目標金額を超える場合' do
        let!(:investment) {
          product.investments.create(
            price: 1000001,
            user_id: user.id
          )
        }
        it '結果が期待通りであること' do
          expect(product.investmentable?).to be false
        end
      end
    end

    context '引数にinvestmentインスタンスが存在する場合' do
      context '目標金額以下場合' do
        before do
          product.investments.create(
             price: 9999,
             user_id: user.id
           )
        end
        let!(:investment) {
          product.investments.create(
            price: 1,
            user_id: user.id
          )
        }

        it '結果が期待通りであること' do
          expect(product.investmentable?(investment)).to be true
        end
      end

      context '目標金額を超える場合' do
        let!(:investment) {
          product.investments.create(
            price: 1000001,
            user_id: user.id
          )
        }
        it '結果が期待通りであること' do
          expect(product.investmentable?(investment)).to be false
        end
      end
    end
  end

  describe '#is_owned_by?' do
    let!(:product) { FactoryBot.create(:product) }

    context 'オーナーの場合' do
      it '結果が期待通りであること' do
        expect(product.is_owned_by?(owner.id)).to be true
      end
    end

    context 'オーナーでない場合' do
      it '結果が期待通りであること' do
        expect(product.is_owned_by?(user.id)).to be false
      end
    end
  end
end
