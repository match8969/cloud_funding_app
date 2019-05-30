class InvestmentReportService

  def initialize

  end

  def period_report(begin_datetime, end_datetime)
    @investment = Investment.includes(:user).includes(:product).where(created_at: begin_datetime..end_datetime)
  end

end