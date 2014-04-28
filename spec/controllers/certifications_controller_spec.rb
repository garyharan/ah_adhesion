require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CertificationsController do

  # This should return the minimal set of attributes required to create a valid
  # Certification. As you add validations to Certification, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "user_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CertificationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all certifications as @certifications" do
      certification = Certification.create! valid_attributes
      get :index, {}, valid_session
      assigns(:certifications).should eq([certification])
    end
  end

  describe "GET show" do
    it "assigns the requested certification as @certification" do
      certification = Certification.create! valid_attributes
      get :show, {:id => certification.to_param}, valid_session
      assigns(:certification).should eq(certification)
    end
  end

  describe "GET new" do
    it "assigns a new certification as @certification" do
      get :new, {}, valid_session
      assigns(:certification).should be_a_new(Certification)
    end
  end

  describe "GET edit" do
    it "assigns the requested certification as @certification" do
      certification = Certification.create! valid_attributes
      get :edit, {:id => certification.to_param}, valid_session
      assigns(:certification).should eq(certification)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Certification" do
        expect {
          post :create, {:certification => valid_attributes}, valid_session
        }.to change(Certification, :count).by(1)
      end

      it "assigns a newly created certification as @certification" do
        post :create, {:certification => valid_attributes}, valid_session
        assigns(:certification).should be_a(Certification)
        assigns(:certification).should be_persisted
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
    describe "with valid params" do
      it "updates the requested certification" do
        certification = Certification.create! valid_attributes
        # Assuming there are no other certifications in the database, this
        # specifies that the Certification created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Certification.any_instance.should_receive(:update).with({ "user_id" => "1" })
        put :update, {:id => certification.to_param, :certification => { "user_id" => "1" }}, valid_session
      end

      it "assigns the requested certification as @certification" do
        certification = Certification.create! valid_attributes
        put :update, {:id => certification.to_param, :certification => valid_attributes}, valid_session
        assigns(:certification).should eq(certification)
      end

      it "redirects to the certification" do
        certification = Certification.create! valid_attributes
        put :update, {:id => certification.to_param, :certification => valid_attributes}, valid_session
        response.should redirect_to(certification)
      end
    end

    describe "with invalid params" do
      it "assigns the certification as @certification" do
        certification = Certification.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Certification.any_instance.stub(:save).and_return(false)
        put :update, {:id => certification.to_param, :certification => { "user_id" => "invalid value" }}, valid_session
        assigns(:certification).should eq(certification)
      end

      it "re-renders the 'edit' template" do
        certification = Certification.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Certification.any_instance.stub(:save).and_return(false)
        put :update, {:id => certification.to_param, :certification => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested certification" do
      certification = Certification.create! valid_attributes
      expect {
        delete :destroy, {:id => certification.to_param}, valid_session
      }.to change(Certification, :count).by(-1)
    end

    it "redirects to the certifications list" do
      certification = Certification.create! valid_attributes
      delete :destroy, {:id => certification.to_param}, valid_session
      response.should redirect_to(certifications_url)
    end
  end

end
