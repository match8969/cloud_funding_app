require 'rails_helper'

describe InvestmentReportService do

  let!(:user) { FactoryBot.create(:user)}
  let!(:other_user) { FactoryBot.create(:user, :other_user) }
  let!(:other_product) { FactoryBot.create(:product, :other_product)}

  describe '#period_investments' do
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
        expect(investment_report_service.period_investments).to_not match_array([investment])
      end
    end

    context '範囲が開始以内の場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2019-01-01', '2019-02-01')
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.period_investments).to match_array([investment])
      end
    end

    context '範囲が終了を超過する場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2018-12-01', '2018-12-31')
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.period_investments).to_not match_array([investment])
      end
    end

    context '範囲が終了以内場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2018-12-01', '2019-01-01') # End: '2019-01-02' ok...
      }

      it '結果が期待通りであること' do
        expect(investment_report_service.period_investments).to match_array([investment])
      end
    end

  end

  describe '#period_achieve_products' do

    let!(:achieve_product) { Product.create(
        title:"achieve p title",
        description: "achieve p description",
        goal_price: 10000,
        due_date: '2019-01-31 00:00:00',
        user_id: other_user.id,
        created_at: '2018-12-31 00:00:00',
        updated_at: '2018-12-31 00:00:00'
    )}

    let!(:investment) { Investment.create(
        price: 10000,
        product_id: achieve_product.id,
        user_id: user.id,
        created_at: '2019-01-01 00:00:00',
        updated_at: '2019-01-01 00:00:00'
    )}

    context '目標金額達成のプロダクトが存在しない場合' do
      let!(:investment_report_service){
        InvestmentReportService.new('2019-01-02', '2019-01-31')
      }

      before do
        achieve_product
        investment
      end

      it '結果が期待通りであること' do
        expect(investment_report_service.period_achieve_products).to_not match_array([achieve_product])
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
        expect(investment_report_service.period_achieve_products).to match_array([achieve_product])
      end
    end

  end

end