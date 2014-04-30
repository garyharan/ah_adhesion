class AddMissingFieldsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :member_since, :integer
    add_column :profiles, :establishment_type, :string
  end
end
