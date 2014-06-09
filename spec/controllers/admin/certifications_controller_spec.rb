require 'spec_helper'

describe Admin::CertificationsController do
  let(:admin) { FactoryGirl.create :user, :with_admin_rights }
  let(:user)  { FactoryGirl.create :user }

  it "will not accept unauthenticated users in" do
    get :index
    response.should_not be_success
  end

  it "will not accept an authenticated user who is not an admin" do
    sign_in user
    get :index
    response.status.should eq 401
  end

  context "as an admin" do
    before do
      sign_in admin

      Certification::POSSIBLE_STATES.keys.each do |state|
        FactoryGirl.create :certification, state.to_sym
      end
    end

    context "#index" do
      it "lets an admin visit the page" do
        get :index
        response.status.should eq 200
      end

      it "assigns certifications" do
        get :index
        assigns(:certifications).should eq Certification.all
      end

      it "only assigns certifications of a given state" do
        Certification::POSSIBLE_STATES.keys.each do |state|
          get :index, state: state
          assigns(:certifications).should eq Certification.send(state)
        end
      end
    end

    context "#edit" do
      it "displays editing page" do
        get :edit, id: Certification.first.id
        response.should be_success
      end
    end

    context "#update" do
      let (:certification) { create :certification, :under_review }

      before do
        request.env["HTTP_REFERER"] = admin_certification_path(certification)
        post :update, id: certification.id, certification: { state: 'approved' }
      end

      it "sends back to show" do
        response.should be_redirect
      end

      it "sets flash" do
        flash[:error] = "unable to save certification details"
      end

      it "changes the certification state" do
        assigns(:certification).reload.state.should eq 'approved'
      end
    end
  end
end
