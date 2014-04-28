require 'spec_helper'

describe ProfilesController do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end
  
  context "with no existing profile" do
    describe "GET 'show'" do
      it "returns http success" do
        expect {
          get :show
          response.should be_success
          assigns(:profile).user_id.should == user.id
        }.to change(Profile, :count).by(1)
      end
    end
  end

  context "with an existing profile" do
    before do
      user.create_profile
    end

    describe "GET 'show'" do
      it "returns http success" do

        expect {
          get :show
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
        post :update, { profile: { name: "newname" } }
        response.should be_redirect
        assigns(:profile).name.should == 'newname'
      end
    end
  end

end
