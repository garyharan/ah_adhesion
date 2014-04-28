require 'spec_helper'

describe "certifications/show" do
  before(:each) do
    @certification = assign(:certification, stub_model(Certification,
      :user_id => 1,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Status/)
  end
end
