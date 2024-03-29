require 'spec_helper'

describe Admin::DossiersController do
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

      Dossier::POSSIBLE_STATES.keys.each do |state|
        FactoryGirl.create :dossier, state.to_sym
      end
    end

    context "#index" do
      it "lets an admin visit the page" do
        get :index
        response.status.should eq 200
      end

      it "assigns dossiers" do
        get :index
        assigns(:dossiers).should eq Dossier.all
      end

      it "only assigns dossiers of a given state" do
        Dossier::POSSIBLE_STATES.keys.each do |state|
          get :index, state: state
          assigns(:dossiers).should eq Dossier.send(state)
        end
      end
    end

    context "#edit" do
      it "displays editing page" do
        get :edit, id: Dossier.first.id
        response.should be_success
      end
    end

    context "#update" do
      let (:dossier) { create :dossier, :under_review }

      before do
        request.env["HTTP_REFERER"] = admin_dossier_path(dossier)
        post :update, id: dossier.id, dossier: { state: 'approved' }
      end

      it "sends back to show" do
        response.should be_redirect
      end

      it "sets flash" do
        flash[:error] = "unable to save dossier details"
      end

      it "changes the dossier state" do
        assigns(:dossier).reload.state.should eq 'approved'
      end
    end
  end
end
