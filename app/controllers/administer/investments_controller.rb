class Administer::InvestmentsController < Administer::Base

  def index
    @investments = Investment.page(params[:page]).per(10)
  end

  def report
    @investment_report_service = InvestmentReportService.new(params[:begin_datetime], params[:end_datetime] )
    @investments = @investment_report_service.period_investments
                       .where(product_id: current_user.products.map { |product| product.id})
    @products = @investment_report_service.period_achieve_products
  end

end
