class Admin::DossiersController < Admin::BaseController
  before_action :find_dossiers, only: :index

  def index
  end

  def edit
    @dossier = Dossier.find params[:id]
  end

  def update
    @dossier = Dossier.find params[:id]

    if @dossier.update_attributes dossier_params
      flash[:success] = "Votre dossier a été créé avec succès."
      redirect_to edit_admin_dossier_path @dossier
    else
      flash[:error] = "unable to save dossier details"
      redirect_to :back
    end
  end

  private

  def find_dossiers
    @dossiers = case params[:state]
                      when nil
                        Dossier.all
                      when *Dossier::POSSIBLE_STATES.keys.map(&:to_s)
                        Dossier.send(params[:state])
                      else
                        raise "No such param"
                      end
  end

  def dossier_params
    params.require(:dossier).permit(:user_id, :state)
  end
end
