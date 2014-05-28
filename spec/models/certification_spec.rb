require 'spec_helper'

describe Certification do
  context "#score" do
    let(:certification) { create :certification }

    before do
      create_list :answer, 3, :unvalidated, certification_id: certification.id
      create_list :answer, 3, :validated,   certification_id: certification.id
    end

    it "provides a score for all valid answers" do
      certification.score.should == 6
    end

    it "provides a scode for all validated answers" do
      certification.validated_score.should == 3
    end
  end
end
