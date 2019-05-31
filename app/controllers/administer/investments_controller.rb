class Administer::InvestmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :administer_user, only: [:index]
  
  def index
    @investments = Investment.all
  end

  def report
    @investments = InvestmentReportService.new(params[:begin_datetime], params[:end_datetime] )
                       .period_report.where(product_id: current_user.products.map { |product| product.id})
  end

end
