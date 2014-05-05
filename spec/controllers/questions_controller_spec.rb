require 'spec_helper'

describe QuestionsController do

  describe "GET 'index'" do
    let(:user) { FactoryGirl.create :user }

    before do
      FactoryGirl.create :section, section_id: 1
      @cert = Certification.create user_id: user.id
      sign_in user
    end

    it "returns http success" do
      get 'index', certification_id: @cert.id
      response.should be_success
    end

    it "assigns questions" do
      get :index, certification_id: @cert.id
      assigns(:questions).should_not be_nil
    end

    it "sets a default section if none given" do
      get :index, certification_id: @cert.id
      assigns(:section).should_not be_nil
    end

    context "last section visited" do
      before do
        FactoryGirl.create :section, section_id: 12
      end

      it "sets the last visited section" do
        get :index, certification_id: @cert.id, section: 12
        user.reload.last_visited_section_id.should == 12
      end

      it "shows the last visited section when accessing it again" do
        get :index, certification_id: @cert.id, section: 12
        get :index, certification_id: @cert.id
        assigns(:section).section_id.should == 12
      end
    end
  end

end
