class InvestmentReportService

  def initialize

  end

  def period_report(begin_datetime, end_datetime)
    @investment = Investment.where(created_at: begin_datetime..end_datetime)
  end

end