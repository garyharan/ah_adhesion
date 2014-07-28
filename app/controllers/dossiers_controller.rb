class DossiersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dossier, only: [:show, :edit, :update, :submit]

  def index
    @dossiers = current_user.dossiers
  end

  def show
    redirect_to dossier_questions_path(@dossier)
  end

  def edit
    # shows the page where we accept contract.  Submitting this means we accept contract.
  end

  def create
    @dossier = current_user.dossiers.new

    if @dossier.save
      redirect_to @dossier, notice: 'Votre dossier a été créé avec succès.'
    else
      render :new
    end
  end

  def update
    if @dossier.update_attributes! dossier_params
      redirect_to merci_path
    end
  end

  def submit
    @dossier.submit
    @dossier.accepted_contract_at = DateTime.now

    if @dossier.save
      redirect_to dossier_payment_path(@dossier)
    end
  end

  def payment

  end

  private
    def set_dossier
      @dossier = Dossier.find(params[:dossier_id] || params[:id])
    end

    def dossier_params
      params.require(:dossier).permit(:user_id, :approval_date, :expected_payment_method, :note)
    end
end
