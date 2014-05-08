class ChangeUpProfile < ActiveRecord::Migration
  def up
    drop_table :profiles

    create_table :profiles do |t|
      t.integer :user_id

      t.string :name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :telephone
      t.string :fax
      t.string :website

      t.string :member_number
      t.string :establishment_type
      t.string :classification
      t.string :number_of_rooms
      t.string :member_since # just a year

      t.string :director_name
      t.string :director_title
      t.string :director_phone
      t.string :director_email

      t.string :manager_name
      t.string :manager_title
      t.string :manager_phone
      t.string :manager_email
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Run this command to destroy the world and kill a puppy"
  end
end
