class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_default_section

  def index
    @questions = Question.all
  end

  private

  def set_default_section
    @section = params[:section] || 1
  end
end
