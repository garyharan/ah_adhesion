require "spec_helper"

describe CertificationsController do
  describe "routing" do

    it "routes to #index" do
      get("/certifications").should route_to("certifications#index")
    end

    it "routes to #show" do
      get("/certifications/1").should route_to("certifications#show", :id => "1")
    end

    it "routes to #create" do
      post("/certifications").should route_to("certifications#create")
    end

  end
end
