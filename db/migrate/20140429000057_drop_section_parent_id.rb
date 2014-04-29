class DropSectionParentId < ActiveRecord::Migration
  def up
    Section.where("subsection_id is not null").each do |s|
      s.update_attribute(:section_id, s.parent_id)
    end
    remove_column :sections, :parent_id
  end
  
  def down
    add_column :sections, :parent_id, :integer
    Section.where("subsection_id is null").each do |s|
      s.update_attribute(:parent_id, s.section_id)
    end
  end
end
