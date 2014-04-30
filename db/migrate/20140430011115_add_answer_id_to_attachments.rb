class AddAnswerIdToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :answer_id, :integer
  end
end
