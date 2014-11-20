class ReportMailer < ActionMailer::Base
  default   to: ["gary.haran@gmail.com", "lopez@ma14.com"],
          from: "reservert@hotelleriequebec.com"

  def report_email(report)
    @report = report
    @url  = admin_dossier_report_url(@report.answer.dossier, @report)

    mail(subject: 'A flagged action was reported')
  end
end
