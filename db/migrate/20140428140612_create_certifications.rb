class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.integer :user_id
      t.string :status
      t.datetime :approval_date

      t.timestamps
    end
  end
end
