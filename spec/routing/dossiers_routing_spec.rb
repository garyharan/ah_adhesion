require "spec_helper"

describe DossiersController do
  describe "routing" do

    it "routes to #index" do
      get("/dossiers").should route_to("dossiers#index")
    end

    it "routes to #show" do
      get("/dossiers/1").should route_to("dossiers#show", :id => "1")
    end

    it "routes to #create" do
      post("/dossiers").should route_to("dossiers#create")
    end

  end
end
