class DossiersController < ApplicationController
  protect_from_forgery expect: [:widget, :widget_voting_system]
  skip_before_action :verify_authenticity_token, only: :widget
  before_action :allow_iframe, only: :widget_voting_system

  before_action :authenticate_user!, except: [:widget, :widget_voting_system]
  before_action :set_dossier, only: [:show, :edit, :update, :submit, :widget, :widget_voting_system]

  layout "widget", only: :widget_voting_system

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

  def widget
  end

  def widget_voting_system
    @concrete_actions = @dossier.answers.where(value: true).order("RANDOM()").limit(3)
  end

  private
    def set_dossier
      @dossier = Dossier.find(params[:dossier_id] || params[:id])
    end

    def dossier_params
      params.require(:dossier).permit(:user_id, :approval_date, :expected_payment_method, :note)
    end
end
