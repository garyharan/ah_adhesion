require 'spec_helper'

describe ApplicationController do
  let(:user) { FactoryGirl.create(:user) }

  it "redirects to certification#index" do
    @request.env["HTTP_REFERER"] = "/"
    controller.after_sign_in_path_for(user).should == certifications_path
  end
end
