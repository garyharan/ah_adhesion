class Admin::CertificationsController < Admin::BaseController
  before_action :find_certifications

  def index
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
end
