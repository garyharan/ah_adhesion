class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :question_fr, limit: 512
      t.string :proof_fr, limit: 1300
      t.string :widget_fr, limit: 512
      t.string :widget_en, limit: 512
      t.string :help_fr, limit: 1300
      t.boolean :renewable

      t.timestamps
    end
  end
end
