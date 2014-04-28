class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_default_section

  def index
    @questions = @section.section_questions.all
  end

  private

  def set_default_section
    section_id = params[:section] || 1
    @section = Section.top_level.find_by_section_id(section_id)
  end
end
