class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :question_fr
      t.string :proof_fr
      t.string :widget_fr
      t.string :widget_en
      t.string :help_fr
      t.boolean :renewable

      t.timestamps
    end
  end
end
