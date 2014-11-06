require "spec_helper"

describe DossiersController do
  let(:dossier) { create(:dossier, :approved) }

  before do
    create_list(:answer, 6, :validated, dossier_id: dossier.id)
  end


  context "widget_voting_system" do
    it "shows 3 random questions answered true" do
      get :widget_voting_system, dossier_id: dossier.id
      assigns(:concrete_actions).count.should eq 3
      assigns(:concrete_actions).first.should be_a Answer
    end
  end
end
