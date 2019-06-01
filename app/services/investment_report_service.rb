class InvestmentReportService
  attr_reader :begin_datetime, :end_datetime

  def initialize(begin_datetime=nil, end_datetime=nil)
    @begin_datetime = begin_datetime ||= Time.zone.now-1.month
    @end_datetime = end_datetime ||= Time.zone.now
  end

  def period_report
    @investments = Investment.includes([:user,:product]).where(created_at: @begin_datetime..@end_datetime)
  end

  def period_achieve_products
    period_investments = self.period_report
    period_invested_products = Product.includes(:user).where(id: period_investments.pluck(:product_id))
    @current_achive_products = period_invested_products.select { |product|
      product.goal_price <= product.investments.where('created_at <= :due_date', due_date: product.due_date ).pluck(:price).sum
    }
  end

end