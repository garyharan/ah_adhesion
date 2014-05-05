require 'spec_helper'

describe PageController do

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
  end

end
