require 'spec_helper'

describe User do
  it "can create a valid user" do
    FactoryGirl.create(:user).valid?.should be_true
  end
end
