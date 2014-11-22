require 'spec_helper'

describe Admin::ReportsController do
  let(:admin)   { FactoryGirl.create :user, :with_admin_rights     }
  let(:dossier) { create :dossier                                  }
  let(:answer)  { create :answer, dossier: dossier                 }
  let(:report)  { create :report, dossier: dossier, answer: answer }

  before do
    sign_in admin
  end

  context "#index" do
    it "assigns reports" do
      get :index, dossier_id: dossier.id
      assigns(:reports).should_not be_nil
    end
  end

  context "#show" do
    it "assigns reports" do
      get :show, id: report.id, dossier_id: dossier.id
      assigns(:report).should eq report
    end
  end
end
