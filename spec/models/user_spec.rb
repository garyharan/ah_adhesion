require 'spec_helper'

describe User do
  it "can create a valid user" do
    FactoryGirl.create(:user).valid?.should be_true
  end

  describe "#latest_dossier" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      user.dossiers.create
    end

    it "can get the latest dossiers" do
      user.latest_dossier.should be_a Dossier
    end

  end
end
