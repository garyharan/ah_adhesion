class Admin::CertificationsController < Admin::BaseController
  before_action :find_certifications, only: :index

  def index
  end

  def edit
    @certification = Certification.find params[:id]
  end

  def update
    @certification = Certification.find params[:id]

    if @certification.update_attributes certification_params
      redirect_to edit_admin_certification_path @certification
    else
      flash[:error] = "unable to save certification details"
      redirect_to :back
    end
  end

  private

  def find_certifications
    @certifications = case params[:state]
                      when nil
                        Certification.all
                      when *Certification::POSSIBLE_STATES
                        Certification.send(params[:state])
                      else
                        raise "No such param"
                      end
  end

  def certification_params
    params.require(:certification).permit(:user_id, :state)
  end
end
