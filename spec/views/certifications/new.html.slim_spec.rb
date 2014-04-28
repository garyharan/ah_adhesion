require 'spec_helper'

describe "certifications/new" do
  before(:each) do
    assign(:certification, stub_model(Certification,
      :user_id => 1,
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new certification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", certifications_path, "post" do
      assert_select "input#certification_user_id[name=?]", "certification[user_id]"
      assert_select "input#certification_status[name=?]", "certification[status]"
    end
  end
end
