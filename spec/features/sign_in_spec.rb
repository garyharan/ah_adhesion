require 'spec_helper'

describe "the signin process", type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  def sign_in
    visit '/'
    within "nav:first" do
      click_link 'Connection'
    end

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Sign in'
  end

  before do
    FactoryGirl.create :section, section_id: 1
    sign_in
  end

  it "signs me in" do
    expect(page).to have_content 'Commencer ma certification'
  end

  context "no certifications" do
    before do
      FactoryGirl.create :question, title: "1.1", section_id: 1
      FactoryGirl.create :section
      FactoryGirl.create :section, subsection_id: 1
    end

    it "guides me to create a certification" do
      click_link 'Commencer ma certification'
      expect(page).to have_content "1.1"
    end
  end
end
