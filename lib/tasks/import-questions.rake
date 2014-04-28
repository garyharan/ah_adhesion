require 'csv'

namespace :script do
  desc "Import questions from CSV file"
  task import_questions_csv: :environment do
    #puts Question.all.length

    Question.all.each { |q| q.destroy }

    CSV.foreach("questions.csv", { headers: :first_row }) do |row|
      q = Question.new

      q.title = row['title']
      q.question_fr = row['question_fr']
      q.help_fr = row['help_fr']
      q.widget_fr = row['widget_fr']
      q.widget_en = row['widget_en']
      q.proof_fr = row['proof_fr']

      q.renewable = row['renewable'] != nil
      q.has_attachments = row['proof_fr'] != nil

      q.save
    end
  end
end
