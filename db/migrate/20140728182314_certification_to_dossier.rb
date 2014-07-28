class CertificationToDossier < ActiveRecord::Migration
  def change
  	rename_table :certifications, :dossiers
  	rename_column :answers, :certification_id, :dossier_id
  end
end
