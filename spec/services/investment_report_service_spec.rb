require 'rails_helper'

describe InvestmentReportService do

  let!(:user) { FactoryBot.create(:user)}
  let!(:other_product) { FactoryBot.create(:product, :other_product)}

  describe '#period_report' do
    let!(:investment) { Investment.create(
        price: 1,
        product_id: other_product.id,
        user_id: user.id,
        created_at: '2019-01-01 00:00:00',
        updated_at: '2019-01-01 00:00:00'
    )}

    context '範囲が開始未満の場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2019-01-02', '2019-02-01')
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.period_report).to_not match_array([investment])
      end
    end

    context '範囲が開始以内の場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2019-01-01', '2019-02-01')
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.period_report).to match_array([investment])
      end
    end

    context '範囲が終了を超過する場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2018-12-01', '2018-12-31')
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.period_report).to_not match_array([investment])
      end
    end

    context '範囲が終了以内場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2018-12-01', '2019-01-01')
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.period_report).to match_array([investment])
      end
    end

  end

  describe '#period_achieve_products' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

end