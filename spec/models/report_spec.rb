require 'spec_helper'

describe Report do
  let(:answer) { create :answer }

  it "should save to a dossier as well" do
    report = Report.create answer: answer, name: "John", email: "john@doe.com", body: "CAEK IS A LIE"
    report.reload.dossier.should be_a Dossier
  end

  it "should update counter" do
    report = Report.create answer: answer, name: "John", email: "john@doe.com", body: "CAEK IS A LIE"
    report.reload.dossier.reports.size.should eq 1
  end
end
