require 'spec_helper'

describe CertificationsController do
  let(:user) { FactoryGirl.create(:user) }

  let(:valid_attributes) { { "user_id" => "1" } }
  let(:valid_session) { {} }

  before do
    sign_in user
  end

  describe "GET index" do
    context "when you have certifications" do
      it "assigns pending certifications as @certifications" do
        user.certifications.create! FactoryGirl.attributes_for(:certification)
        user.certifications.create! FactoryGirl.attributes_for(:certification, state: 'expired')
        get :index, {}, valid_session
        assigns(:certifications).count.should == 2
      end
    end

    context "when you do not have certifications" do
      it "redirects you to create a new one" do
        get :index, {}, valid_session
        assigns(:certifications).count.should == 0
      end
    end
  end

  describe "GET show" do
    it "assigns the requested certification as @certification" do
      certification = Certification.create! valid_attributes
      get :show, {:id => certification.to_param}, valid_session
      assigns(:certification).should == certification
      response.should redirect_to certification_questions_path(certification)
    end
  end

  describe "GET edit" do
    it "shows the page" do
      certification = Certification.create! valid_attributes
      get :edit, {id: certification.to_param}, valid_session
      response.should be_success
    end
  end

  # /certifications/27/answers?page=1
  # response.should_redirect_to certification_answers_path(assigns(:certification), page: 1)
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Certification" do
        expect {
          post :create, {}, valid_session
        }.to change(Certification, :count).by(1)
      end

      it "assigns a newly created pending certification as @certification" do
        post :create, {:certification => valid_attributes}, valid_session
        assigns(:certification).should be_a(Certification)
        assigns(:certification).should be_persisted
        assigns(:certification).draft?.should be_true
      end

      it "redirects to the created certification" do
        post :create, {:certification => valid_attributes}, valid_session
        response.should redirect_to(Certification.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved certification as @certification" do
        # Trigger the behavior that occurs when invalid params are submitted
        Certification.any_instance.stub(:save).and_return(false)
        post :create, {:certification => { "user_id" => "invalid value" }}, valid_session
        assigns(:certification).should be_a_new(Certification)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Certification.any_instance.stub(:save).and_return(false)
        post :create, {:certification => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    let(:certification) { FactoryGirl.create :certification, user_id: user.id }

    before do
      put :update, { id: certification.id, certification: { expected_payment_method: "cheque" } }
    end

    it "redirects to thank you page" do
      response.should redirect_to merci_path
    end

    it "allows updating of expected_payment_method" do
      user.latest_certification.expected_payment_method.should == "cheque"
    end
  end

  describe "POST submit" do
    let(:certification) { FactoryGirl.create :certification }

    it "should change the state to pending_payment" do
      post :submit, { :certification_id => certification.id }
      assigns(:certification).state.should == "pending_payment"
    end

    it "should set the certification accepted_contract date" do
      post :submit, { :certification_id => certification.id }
      assigns(:certification).accepted_contract_at.should_not be_nil
    end
  end

end
