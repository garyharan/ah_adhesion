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

      Certification::POSSIBLE_STATES.each do |state|
        FactoryGirl.create :certification, state.to_sym
      end
    end

    context "#index" do
      before do
      end

      it "lets an admin visit the page" do
        get :index
        response.status.should eq 200
      end

      it "assigns certifications" do
        get :index
        assigns(:certifications).should eq Certification.all
      end

      it "only assigns certifications of a given state" do
        Certification::POSSIBLE_STATES.each do |state|
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
  end
end
