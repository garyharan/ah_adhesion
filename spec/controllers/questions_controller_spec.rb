require 'spec_helper'

describe QuestionsController do

  describe "GET 'index'" do
    let(:user) { FactoryGirl.create :user }

    before do
      FactoryGirl.create :section, section_id: 1
      sign_in user
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "assigns questions" do
      get :index
      assigns(:questions).should_not be_nil
    end

    it "sets a default section if none given" do
      get :index
      assigns(:section).should_not be_nil
    end
  end

end
