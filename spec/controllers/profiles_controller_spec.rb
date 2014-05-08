require 'spec_helper'

describe ProfilesController do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  context "with no existing profile" do
    describe "GET 'edit'" do
      it "returns http success" do
        expect {
          get :edit
          response.should be_success
          assigns(:profile).user_id.should == user.id
        }.to change(Profile, :count).by(0)
      end
    end
  end

  context "with an existing profile" do
    before do
      user.create_profile
    end

    describe "GET 'edit'" do
      it "creates profile if it does not exist" do

        expect {
          get :edit
          response.should be_success
          assigns(:profile).user_id.should == user.id
        }.to change(Profile, :count).by(0)
      end
    end

    describe "GET 'edit'" do
      it "returns http success" do
        get :edit
        response.should be_success
      end
    end

    describe "GET 'update'" do
      it "returns http success" do
        user.profile.update_attribute(:name, "oldname")
        post :update, { profile: { name: "newname", establishment_type: "Résidences de tourisme", member_since: "2014" } }
        response.should be_redirect
        assigns(:profile).name.should == 'newname'
        assigns(:profile).establishment_type.should == 'Résidences de tourisme'
        assigns(:profile).member_since.should == "2014"
      end
    end
  end

end
