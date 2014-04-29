require 'spec_helper'

describe ApplicationController do
  let(:user) { FactoryGirl.create(:user) }

  it "redirects to certification#index" do
    @controller.after_sign_in_path_for(user).should == certifications_path
  end

  it "defaults to french when no http accept languages" do
    @controller.set_locale.should == :fr
  end

  it "sets the active certification" do
    sign_in user
    user.certifications.create FactoryGirl.attributes_for(:certification, state: 'draft')
    @controller.set_active_certification.should_not be_nil
    @controller.instance_variable_get(:@active_certification).should == user.certifications.first
  end
end
