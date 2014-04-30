class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :comment
      t.string :url
      t.string :filename
      t.string :filepath
      t.string :filesize
      t.string :filetype

      t.timestamps
    end
  end
end
