class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_administrator_rights!

  def index
    head :ok
  end

  private

  def ensure_administrator_rights!
    unless current_user && current_user.admin?
      render text: "Not authorized", status: 401
    end
  end
end
