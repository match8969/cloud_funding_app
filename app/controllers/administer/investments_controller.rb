class Administer::InvestmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :administer_user, only: [:index]
  
  def index
    @investments = Investment.all
  end

  def report
    investment_report_service = InvestmentReportService.new(params[:begin_datetime], params[:end_datetime] )
    @investments = investment_report_service.period_report
                       .where(product_id: current_user.products.map { |product| product.id})

    @products = investment_report_service.period_achieve_products
  end

end
