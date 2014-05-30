require 'spec_helper'

describe Profile do
  context "#complete" do
    let(:complete_profile)   { FactoryGirl.build :profile, :complete   }
    let(:incomplete_profile) { FactoryGirl.build :profile, :incomplete }

    it "is only complete if all fields are present" do
      incomplete_profile.complete?.should be_false
      complete_profile.complete?.should be_true
    end
  end
end
