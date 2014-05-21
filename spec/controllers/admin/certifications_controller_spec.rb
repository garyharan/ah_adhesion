require 'spec_helper'

describe Admin::CertificationsController do
  let(:admin) { FactoryGirl.create :user, :with_admin_rights }
  let(:user)  { FactoryGirl.create :user }

  it "will not accept unauthenticated users in" do
    get :index
    response.should_not be_success
  end

  it "will not accept an authenticated user who is not an admin" do
    sign_in user
    get :index
    response.status.should eq 401
  end

  it "lets an admin visit the page" do
    sign_in admin
    get :index
    response.status.should eq 200
  end
end
