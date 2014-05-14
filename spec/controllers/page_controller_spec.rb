require 'spec_helper'

describe PageController do

  let(:user) { FactoryGirl.create :user }

  before do
    user.certifications.create
    sign_in user
  end

  it "returns http success for pages" do
    %w(home how_this_works merci).each do |page|
      get page
      response.should be_success
    end
  end

  describe "GET 'paypal_sucess'" do
    it "redirects to merci" do
      get 'paypal_success'
      response.should redirect_to(merci_path)
    end

    it "sets latest certification payment method" do
      get 'paypal_success'
      user.latest_certification.expected_payment_method.should == "paypal"
    end
  end

end
