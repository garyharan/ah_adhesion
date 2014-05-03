class MakeAnswersDefaultToFalse < ActiveRecord::Migration
  def change
    change_column :answers, :value, :boolean, default: false
  end
end
