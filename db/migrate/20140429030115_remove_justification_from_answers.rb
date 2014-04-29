class RemoveJustificationFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :justification
  end
end
