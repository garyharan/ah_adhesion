class PageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment_method, only: [:paypal_success]

  def home
  end

  def how_this_works
  end

  def paypal_success
    redirect_to merci_path
  end

  def merci
  end

  private

  def set_payment_method
    current_user.latest_certification.update_attribute :expected_payment_method, 'paypal'
  end
end
