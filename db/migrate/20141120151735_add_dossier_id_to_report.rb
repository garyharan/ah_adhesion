class AddDossierIdToReport < ActiveRecord::Migration
  def change
    add_column :reports, :dossier_id, :integer
  end
end
