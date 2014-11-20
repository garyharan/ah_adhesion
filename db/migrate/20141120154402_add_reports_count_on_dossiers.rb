class AddReportsCountOnDossiers < ActiveRecord::Migration
  def change
    add_column :dossiers, :reports_count, :integer
  end
end
