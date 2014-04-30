require 'spec_helper'

describe Answer do
  it "answers yes if value is true" do
    FactoryGirl.build(:answer, value: true).yes?.should be_true
  end
end
