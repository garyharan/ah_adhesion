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

  desc "Import section titles"
  task sections: :environment do
    Section.delete_all
    raise "not all deleted" unless Section.count == 0
    
    CSV.foreach("db/sections.csv", { headers: :first_row }) do |row|
      Section.create section_id: row["section_id"].to_i, title_fr: row["title_fr"]
    end
    CSV.foreach("db/subsections.csv", { headers: :first_row}) do |row|
      parent_id, subsection_id = row["id"].split(".")
      Section.create parent_id: parent_id, subsection_id: subsection_id, title_fr: row["title_fr"]
    end
  end
end
