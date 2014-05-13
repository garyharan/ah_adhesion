require 'spec_helper'

describe AdminUser do
  it "can be valid" do
    AdminUser.new(email: "admin@reservert.com", password: "password").valid?.should be_true
  end
end
