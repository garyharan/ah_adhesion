require 'spec_helper'

describe "routing to page" do

  it "routes root to page#home" do
    expect(get: '/').to route_to( controller: "page", action: "home")
  end
end
