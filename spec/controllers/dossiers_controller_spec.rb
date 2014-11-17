require 'spec_helper'

describe DossiersController do
  let(:user) { FactoryGirl.create(:user) }

  let(:valid_attributes) { { "user_id" => "1" } }
  let(:valid_session) { {} }

  before do
    sign_in user
  end

  describe "GET index" do
    context "when you have dossiers" do
      it "assigns pending dossiers as @dossiers" do
        user.dossiers.create! FactoryGirl.attributes_for(:dossier)
        user.dossiers.create! FactoryGirl.attributes_for(:dossier, state: 'expired')
        get :index, {}, valid_session
        assigns(:dossiers).count.should == 2
      end
    end

    context "when you do not have dossiers" do
      it "redirects you to create a new one" do
        get :index, {}, valid_session
        assigns(:dossiers).count.should == 0
      end
    end
  end

  describe "GET show" do
    it "assigns the requested dossier as @dossier" do
      dossier = Dossier.create! valid_attributes
      get :show, {:id => dossier.to_param}, valid_session
      assigns(:dossier).should == dossier
      response.should redirect_to dossier_questions_path(dossier)
    end
  end

  describe "GET edit" do
    it "shows the page" do
      dossier = Dossier.create! valid_attributes
      get :edit, {id: dossier.to_param}, valid_session
      response.should be_success
    end
  end

  # /dossiers/27/answers?page=1
  # response.should_redirect_to dossier_answers_path(assigns(:dossier), page: 1)
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Dossier" do
        expect {
          post :create, {}, valid_session
        }.to change(Dossier, :count).by(1)
      end

      it "assigns a newly created pending dossier as @dossier" do
        post :create, {:dossier => valid_attributes}, valid_session
        assigns(:dossier).should be_a(Dossier)
        assigns(:dossier).should be_persisted
        assigns(:dossier).draft?.should be_true
      end

      it "redirects to the created dossier" do
        post :create, {:dossier => valid_attributes}, valid_session
        response.should redirect_to(Dossier.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dossier as @dossier" do
        # Trigger the behavior that occurs when invalid params are submitted
        Dossier.any_instance.stub(:save).and_return(false)
        post :create, {:dossier => { "user_id" => "invalid value" }}, valid_session
        assigns(:dossier).should be_a_new(Dossier)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Dossier.any_instance.stub(:save).and_return(false)
        post :create, {:dossier => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    let(:dossier) { FactoryGirl.create :dossier, user_id: user.id }

    before do
      put :update, { id: dossier.id, dossier: { expected_payment_method: "cheque" } }
    end

    it "redirects to thank you page" do
      response.should redirect_to merci_path
    end

    it "allows updating of expected_payment_method" do
      user.latest_dossier.expected_payment_method.should == "cheque"
    end
  end

  describe "POST submit" do
    let(:dossier) { FactoryGirl.create :dossier }

    it "should change the state to pending_payment" do
      post :submit, { :dossier_id => dossier.id }
      assigns(:dossier).state.should == "pending_payment"
    end

    it "should set the dossier accepted_contract date" do
      post :submit, { :dossier_id => dossier.id }
      assigns(:dossier).accepted_contract_at.should_not be_nil
    end
  end

  context "widgets" do

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

      it "should allow us to display all" do
        get :widget_voting_system, dossier_id: dossier.id, display: 'all'
        assigns(:concrete_actions).count.should eq 6
      end
    end
  end
end
