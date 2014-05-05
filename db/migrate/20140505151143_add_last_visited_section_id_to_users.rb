class AddLastVisitedSectionIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_visited_section_id, :integer, default: 1
  end
end
