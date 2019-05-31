class InvestmentReportService
  attr_reader :begin_datetime, :end_datetime

  def initialize(begin_datetime, end_datetime)
    @begin_datetime = begin_datetime
    @end_datetime = end_datetime
  end

  def period_report
    @investment = Investment.includes([:user,:product]).where(created_at: @begin_datetime..@end_datetime)
  end

end