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
    vote_for(@answer)
    render plain: "NEW VOTES COUNT: #{@answer.votes}", status: 202 # accepted
  end

  private

  def vote_for(answer)
    return if voted_for?(answer)

    answer.update_attribute :votes, answer.votes.to_i + 1

    cookies[:voted_for] = {
      value: votes.concat([answer.id]).join(','), expires: 12.year.from_now
    }
  end

  def voted_for?(answer)
    votes.include?(answer.id.to_s)
  end

  def votes
    (cookies[:voted_for] || "").split(",")
  end

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
