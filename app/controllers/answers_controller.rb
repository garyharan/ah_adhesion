class AnswersController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create

  def create
    @answer = find_or_create_answer

    if save_answer
      render "attachments/new", layout: false
    end
  end

  def update
    create
  end

  private

  def save_answer
    if @answer.persisted?
      @answer.update answer_params
    else
      @answer.save
    end
  end

  def find_or_create_answer
    Answer.find_by_question_id_and_certification_id(answer_params[:question_id], answer_params[:certification_id]) || Answer.new(answer_params)
  end

  def answer_params
    params.require(:answer).permit(:question_id, :certification_id, :value)
  end
end
