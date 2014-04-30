class AddAcceptedContractOnCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :accepted_contract_at, :datetime
  end
end
