class Admin::ReportsController < Admin::BaseController
  before_filter :find_dossier

  def index
    @reports = @dossier.reports
  end

  def show
    @report = @dossier.reports.find params[:id]
  end

  private

  def find_dossier
    @dossier = Dossier.find params[:dossier_id]
  end
end
