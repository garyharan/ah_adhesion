require 'spec_helper'

describe ApplicationController do
  let(:user) { FactoryGirl.create(:user) }

  context "with an active dossier" do
    it "redirects to dossier#show" do
      sign_in user
      dossier = user.dossiers.create!
      @controller.stub(:profile_incomplete?) { false }
      @controller.set_active_dossier # mimic the before_action
      @controller.after_sign_in_path_for(user).should == dossier_path(dossier)
    end
  end

  context "without a profile filled out" do
    it "redirects to profile path" do
      sign_in user
      @controller.after_sign_in_path_for(user).should == edit_profil_path
    end
  end

  context "without an active dossier" do
    it "redirects to dossier#index" do
      sign_in user
    @controller.stub(:profile_incomplete?) { false }
      @controller.after_sign_in_path_for(user).should == dossiers_path
    end
  end

  context "language" do
    it "defaults to french when no http accept languages" do
      @controller.set_locale.should == :fr
    end

    it "allows for override using a cookie" do
      @controller.stub(:cookies) { {chosen_language: :en} }
      @controller.set_locale.should == :en
    end
  end

  it "sets the active dossier" do
    sign_in user
    @controller.stub(:profile_incomplete?) { false }
    user.dossiers.create FactoryGirl.attributes_for(:dossier, state: 'draft')
    @controller.set_active_dossier.should_not be_nil
    @controller.instance_variable_get(:@active_dossier).should == user.dossiers.first
  end
end
