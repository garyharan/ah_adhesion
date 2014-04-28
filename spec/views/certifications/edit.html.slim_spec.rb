require 'spec_helper'

describe "certifications/edit" do
  before(:each) do
    @certification = assign(:certification, stub_model(Certification,
      :user_id => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit certification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", certification_path(@certification), "post" do
      assert_select "input#certification_user_id[name=?]", "certification[user_id]"
      assert_select "input#certification_status[name=?]", "certification[status]"
    end
  end
end
