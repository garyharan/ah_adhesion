class ChangeStateColumnName < ActiveRecord::Migration
  def change
    rename_column :certifications, :status, :state
  end
end
