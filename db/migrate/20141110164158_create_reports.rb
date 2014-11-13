class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :email
      t.text :body
      t.references :answer

      t.timestamps
    end
  end
end
