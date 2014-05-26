require 'spec_helper'

describe Certification do
  context "#score" do
    let(:certification) { create :certification }

    before do
      create_list :answer, 3, :adding_to_score, certification_id: certification.id
    end

    it "provides a score for all valid answers" do
      certification.score.should == 3
    end
  end
end
