require 'csv'

namespace :import do
  desc "Import questions from CSV file"
  task questions: :environment do
    Question.all.each { |q| q.destroy }

    CSV.foreach("db/questions.csv", { headers: :first_row }) do |row|
      q = Question.new

      q.title = row['title']
      q.question_fr = row['question_fr']
      q.help_fr = row['help_fr']
      q.widget_fr = row['widget_fr']
      q.widget_en = row['widget_en']
      q.proof_fr = row['proof_fr']

      q.renewable = row['renewable'] != nil

      q.save
    end
  end
end
