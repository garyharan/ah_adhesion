class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :certification_id
      t.integer :question_id
      t.boolean :value
      t.text :justification

      t.timestamps
    end
  end
end
