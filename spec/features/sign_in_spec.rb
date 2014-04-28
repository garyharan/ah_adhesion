require 'spec_helper'

describe "the signin process", type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  it "signs me in" do
    visit '/'
    click_link 'Connection'

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Sign in'
    expect(page).to have_content 'Commencer ma certification'
  end
end
