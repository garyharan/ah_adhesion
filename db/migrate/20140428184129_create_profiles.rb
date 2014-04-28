class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id

      t.string :name
      t.string :member_number
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :director
      t.string :director_title
      t.string :certification_manager
      t.string :certification_manager_title
      t.string :telephone
      t.string :fax
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
