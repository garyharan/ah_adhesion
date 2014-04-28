require 'spec_helper'

describe Certification do
  let(:user) { FactoryGirl.create(:user) }

  it "has a pending scope" do
    FactoryGirl.create(:certification, state: :pending)
    Certification.pending.count.should == 1
  end
end
