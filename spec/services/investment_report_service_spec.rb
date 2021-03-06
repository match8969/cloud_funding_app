require 'rails_helper'

describe InvestmentReportService do

  let!(:user) { FactoryBot.create(:user)}
  let!(:other_user) { FactoryBot.create(:user, :other_user) }
  let!(:other_product) { FactoryBot.create(:product, :other_product)}

  describe '#investments_in_period' do
    let!(:investment) {
      Timecop.freeze(Time.local(2019, 1, 1)) {
        Investment.create(
          price: 1,
          product_id: other_product.id,
          user_id: user.id
        )
      }
    }

    context '範囲が開始未満の場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2019-01-02', '2019-02-01')
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.investments_in_period).to_not match_array([investment])
      end
    end

    context '範囲が開始以内の場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2019-01-01', '2019-02-01')
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.investments_in_period).to match_array([investment])
      end
    end

    context '範囲が終了を超過する場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2018-12-01', '2018-12-31')
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.investments_in_period).to_not match_array([investment])
      end
    end

    context '範囲が終了以内場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2018-12-01', '2019-01-01')
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.investments_in_period).to match_array([investment])
      end
    end

  end

  describe '#satisfied_products_in_period' do

    let!(:achieve_product) {
      Timecop.freeze(Time.local(2018, 12, 31)) {
        Product.create(
            title:"achieve p title",
            description: "achieve p description",
            goal_price: 10000,
            due_date: '2019-01-31 00:00:00',
            user_id: other_user.id
        )
      }
    }

    let!(:investment) {
      Timecop.freeze(Time.local(2019, 1, 1)) {
        Investment.create(
          price: 10000,
          product_id: achieve_product.id,
          user_id: user.id
        )
      }
    }

    context '目標金額達成のプロダクトが存在しない場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2019-01-02', '2019-01-31')
      }

      before do
        achieve_product
        investment
      end

      it '結果が期待通りであること' do
        expect(investment_report_service.satisfied_products_in_period).to_not match_array([achieve_product])
      end
    end

    context '目標金額達成のプロダクトが存在する場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2019-01-01', '2019-01-31')
      }

      before do
        achieve_product
        investment
      end

      it '結果が期待通りであること' do
          expect(investment_report_service.satisfied_products_in_period).to match_array([achieve_product])
      end
    end

  end

end