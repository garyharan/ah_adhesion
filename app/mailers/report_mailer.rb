class ReportMailer < ActionMailer::Base
  default to: ["gary.haran@gmail.com", "lopez@ma14.com"]

  def report_email(report)
    @report = report
    @url  = "https://adhesion.reservert.com/admin/reports/whatever/#{@report.answer.id}"

    mail(to: 'gary.haran+recipient@gmail.com', subject: 'A flagged action was reported')
  end
end
