require "spec_helper"

describe ReportMailer do
  let(:report) { create :report }

  it "should send an email" do
    email = ReportMailer.report_email(report).deliver

    ActionMailer::Base.deliveries.empty?.should be_false

    email.from.should eq ['reservert@hotelleriequebec.com']
    email.to.should eq ["gary.haran@gmail.com", "lopez@ma14.com"]
    email.subject.should eq 'A flagged action was reported'
    email.body.to_s.should include admin_dossier_report_url(report.answer.dossier, report)
  end
end
