class Admin::CertificationsController < Admin::BaseController
  def index
    @certifications = Certification.all
  end
end
