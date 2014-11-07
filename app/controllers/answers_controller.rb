class AnswersController < ApplicationController
  protect_from_forgery expect: [:vote, :flag]
  skip_before_filter :verify_authenticity_token, only: [:create, :vote, :flag]

  def create
    @answer = find_or_create_answer

    if save_answer
      render template: "attachments/new.html.slim", layout: false, locals: { answer: @answer }
    end
  end

  def update
    create
  end

  def vote
    @answer = Answer.find(params[:id])
    @answer.update_attribute :votes, @answer.votes.to_i + 1
    render plain: "NEW VOTES COUNT: #{@answer.votes}",  status: 202 # accepted
  end

  def flag
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
    Answer.find_by_question_id_and_dossier_id(answer_params[:question_id], answer_params[:dossier_id]) || Answer.new(answer_params)
  end

  def answer_params
    params.require(:answer).permit(:question_id, :dossier_id, :value, :validated, :note)
  end
end
