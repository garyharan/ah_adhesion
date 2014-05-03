class AnswersSearch
  def initialize(answers_hash, certification)
    @answers_hash  = answers_hash
    @certification = certification
  end

  def self.for_questions_and_certification(questions, certification)
    answers = Answer.where(question_id: questions.collect(&:id), certification_id: certification.id)
    answers_hash = Hash[answers.collect {|a| [a.question_id, a]}]
    AnswersSearch.new(answers_hash, certification)
  end

  def answer_for(question)
    @answers_hash[question.id] || Answer.create(certification_id: @certification.id, question_id: question.id)
  end
end
