class CertificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_certification, only: [:show, :edit, :update, :destroy]

  def index
    @certifications = current_user.certifications
  end

  def show
  end

  def create
    @certification = current_user.certifications.new

    if @certification.save
      redirect_to @certification, notice: 'Certification was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certification
      @certification = Certification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def certification_params
      params.require(:certification).permit(:user_id, :status, :approval_date)
    end
end
