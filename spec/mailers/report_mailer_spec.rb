require "spec_helper"

describe ReportMailer do
  let(:report) { create :report }

  it "should send an email" do
    email = ReportMailer.report_email(report).deliver

    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['me@example.com'], email.from
    assert_equal ['friend@example.com'], email.to
    assert_equal 'You have been invited by me@example.com', email.subject
    assert_equal read_fixture('invite').join, email.body.to_s
  end
end
