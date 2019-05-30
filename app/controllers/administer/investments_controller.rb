class Administer::InvestmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :administer_user, only: [:index]
  
  def index
    @investments = Investment.all
  end

  def report
    puts "-----Administer::InvestmentsController#report-----"
    puts "params[:begin_datetime]=#{params[:begin_datetime]}"
    puts "params[:end_datetime]=#{params[:end_datetime]}"
    # TODO:　ロジック
    all_report_investments = InvestmentReportService.new.period_report(params[:begin_datetime], params[:end_datetime] )
    @investments = all_report_investments.where(product_id: current_user.products.pluck(:id))
  end

  # TODO: 不要ならdelete

  # private
  #   def report_params
  #     params.require(:investment_report_service).permit(begin_datetime, end_datetime)
  #   end
end
