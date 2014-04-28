class CertificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_certification, only: [:show, :edit, :update, :destroy]

  # GET /certifications
  def index
    @certifications = current_user.certifications.pending
  end

  # GET /certifications/1
  def show
  end

  # GET /certifications/new
  def new
    @certification = Certification.new
  end

  # GET /certifications/1/edit
  def edit
  end

  # POST /certifications
  def create
    @certification = Certification.new(certification_params)

    if @certification.save
      redirect_to @certification, notice: 'Certification was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /certifications/1
  def update
    if @certification.update(certification_params)
      redirect_to @certification, notice: 'Certification was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /certifications/1
  def destroy
    @certification.destroy
    redirect_to certifications_url, notice: 'Certification was successfully destroyed.'
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
