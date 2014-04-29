class AnswersSearch
  def self.for_questions_and_certification(questions, certification)
    answers = Answer.where(question_id: questions.collect(&:id), certification_id: certification.id)
    answers_hash = Hash[answers.collect {|a| [a.question_id, a]}]
    AnswersSearch.new(answers_hash)
  end

  def initialize(answers_hash)
    @answers_hash = answers_hash
  end

  def answer_for(question)
    @answers_hash[question.id]
  end
end