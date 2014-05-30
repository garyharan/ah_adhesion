class AddNotesToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :note, :text
  end
end
