class PageController < ApplicationController
  def home
  end

  def how_this_works
  end

  def paypal_success
    redirect_to merci_path
  end

  def merci
  end
end
