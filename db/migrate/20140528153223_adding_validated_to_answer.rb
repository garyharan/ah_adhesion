class AddingValidatedToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :validated, :boolean, default: false
  end
end
