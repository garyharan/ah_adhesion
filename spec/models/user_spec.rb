require 'spec_helper'

describe User do
  it "can create a valid user" do
    FactoryGirl.create(:user).valid?.should be_true
  end

  describe "#latest_certification" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      user.certifications.create
    end

    it "can get the latest certifications" do
      user.latest_certification.should be_a Dossier
    end

  end
end
