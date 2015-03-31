class SetApprovalDateToAllApprovedDossiers < ActiveRecord::Migration
  def up
    Dossier.where(approval_date: nil, state: :approved).each do |dossier|
      dossier.update_attribute :approval_date, DateTime.now
    end
  end

  def down
  end
end
