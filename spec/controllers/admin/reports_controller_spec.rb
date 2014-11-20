require 'spec_helper'

describe Admin::ReportsController do
  let(:admin) { FactoryGirl.create :user, :with_admin_rights }
  let(:dossier) { create :dossier }

  context "index" do
    before do
      sign_in admin
    end

    it "assigns reports" do
      get :index, dossier_id: dossier.id
      assigns(:reports).should_not be_nil
    end
  end
end
