class AddOrderColumn < ActiveRecord::Migration
  def up
    add_column :questions, :sort_order, :integer
    Question.all.each do |q|
      items = q.title.split(".")
      q.sort_order = items[0].to_i * 10_000 + items[1].to_i * 100 + items[2].to_i
      q.save
    end
  end
  
  def down
    remove_column :questions, :sort_order
  end
end
