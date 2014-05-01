class CertificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_certification, only: [:show, :edit, :submit]

  def index
    @certifications = current_user.certifications
  end

  def show
    redirect_to certification_questions_path(@certification)
  end

  def edit
    # shows the page where we accept contract.  Submitting this means we accept contract.
  end

  def create
    @certification = current_user.certifications.new

    if @certification.save
      redirect_to @certification, notice: 'Certification was successfully created.'
    else
      render :new
    end
  end

  def submit
    @certification.submit
    @certification.accepted_contract_at = DateTime.now

    if @certification.save
      redirect_to certification_payment_path(@certification)
    end
  end

  def payment

  end

  private
    def set_certification
      @certification = Certification.find(params[:certification_id] || params[:id])
    end

    def certification_params
      params.require(:certification).permit(:user_id, :status, :approval_date)
    end
end
