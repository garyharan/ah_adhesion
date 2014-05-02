ActiveAdmin.register Certification do

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  scope :pending_payment, default: true
  scope :all

  member_action :mark_paid, :method => :post do
    cert = Certification.find(params[:id])
    cert.paid!
    redirect_to admin_certifications_path, :notice => "Certification envoyée au mandataire!"
  end
  
  action_item only: :show do
    link_to('Payé', mark_paid_admin_certification_path(params[:id]), method: :post)
  end
end
