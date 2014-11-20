require 'spec_helper'

describe ReportsController do
  let(:answer) { create :answer }

  context "GET new" do
    it "shows a report form page" do
      get :new, answer_id: answer.id
      response.should be_success
      assigns(:answer).should eq answer
    end
  end

  it "allows creation of a report" do
    expect {
      post :create, report: { name: "John Complainer", email: "valid@email.org", body: "Yeah their soap is not green", answer_id: answer.id }, answer_id: answer.id
    }.to change(Report, :count).by 1
    response.should be_success
    response.should render_template("thank_you")
  end

  it "sends an email" do
    ReportMailer.should_receive(:report_email).and_return( double("Mailer", :deliver => true) )
    post :create, report: { name: "John Complainer", email: "valid@email.org", body: "Yeah their soap is not green", answer_id: answer.id }, answer_id: answer.id
  end

  it "allows us to say thank you" do
    get :thank_you, answer_id: answer.id, id: 1
    response.should be_success
  end
end
