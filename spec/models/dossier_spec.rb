require 'spec_helper'

describe Dossier do
  context "#score" do
    let(:dossier) { create :dossier }

    before do
      create_list :answer, 3, :unvalidated, dossier_id: dossier.id
      create_list :answer, 3, :validated,   dossier_id: dossier.id
    end

    it "provides a score for all valid answers" do
      dossier.score.should == 6
    end

    it "provides a scode for all validated answers" do
      dossier.validated_score.should == 3
    end

    it "should have a profile attached to it" do
      dossier.user = create(:user, :with_profile)
      dossier.profile.should_not be_nil
    end

    it "should set the approval date when approving it" do
      dossier.approval_date = nil
      dossier.state = :approved
      dossier.save
      dossier.approval_date.should_not be_nil
    end
  end
end
