class InvestmentReportService

  # TODO: delete if no use
  def initialize

  end

  # TODO:　命名 reportよりも明確に。どんなreport??
  def report
    # ロジックを記載する
    # return: investments
    # args: user, period
    # TODO: どうやって情報をとる??
  end

  # test
  # return: investments
  # params: 日付
  # note: userは取得しない
  def period_report(begin_datetime, end_datetime)
    puts "---InvestmentReportService#period_report---"
    @investment = Investment.where(created_at: begin_datetime..end_datetime)
  end

end