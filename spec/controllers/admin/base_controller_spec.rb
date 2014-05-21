require 'spec_helper'

describe Admin::BaseController do
  it "will not accept unauthenticated users in" do
    get :index
    response.should_not be_success
  end

  it "will not accept an authenticated user who is not an admin" do
    sign_in FactoryGirl.create :user
    get :index
    response.status.should eq 401
  end
end
