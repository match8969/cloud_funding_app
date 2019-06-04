class InvestmentReportService
  attr_reader :begin_datetime, :end_datetime

  def initialize(begin_datetime, end_datetime)
    @begin_datetime = begin_datetime ||= Time.zone.now-1.month
    @end_datetime = end_datetime ||= Time.zone.now
  end

  def period_investments
    @investments = Investment.includes([:user,:product]).where(updated_at: @begin_datetime..@end_datetime)
  end

  def period_achieve_products
    products = Product.includes(:user).joins(:investments).where(investments: {updated_at: @begin_datetime..@end_datetime})
                   .group(:id).select('products.*, sum(investments.price) as total_price')
    @result_products = products.select {|product| product.goal_price <= product.total_price  }
  end

end