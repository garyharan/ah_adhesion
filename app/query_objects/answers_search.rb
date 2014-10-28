class AnswersSearch
  def initialize(answers_hash, dossier)
    @answers_hash  = answers_hash
    @dossier = dossier
  end

  def self.for_questions_and_dossier(questions, dossier)
    answers = Answer.where(question_id: questions.collect(&:id), dossier_id: dossier.id)
    answers_hash = Hash[answers.collect {|a| [a.question_id, a]}]
    AnswersSearch.new(answers_hash, dossier)
  end

  def answer_for(question)
    @answers_hash[question.id] || Answer.create(dossier_id: @dossier.id, question_id: question.id)
  end
end
