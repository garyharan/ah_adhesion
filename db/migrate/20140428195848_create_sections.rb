class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.integer :section_id
      t.integer :parent_id
      t.integer :subsection_id
      t.string :title_fr
    
      t.timestamps
    end
    add_column :questions, :section_id, :integer
    add_column :questions, :subsection_id, :integer
    add_column :questions, :patch_version, :integer

    Question.all.each do |q|
      section_id, subsection_id, minor_version = q.title.split(".").collect(&:to_i)
      q.update_attributes(section_id: section_id, subsection_id: subsection_id, patch_version: minor_version)
    end
  end

  def down
    drop_table :sections
    remove_column :questions, :section_id
    remove_column :questions, :subsection_id
    remove_column :questions, :patch_version
  end
end
