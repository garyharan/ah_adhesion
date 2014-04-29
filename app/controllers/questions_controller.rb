class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_default_section
  before_filter :find_certification

  def index
    @questions    = Question.where(section_id: @section.section_id).order("subsection_id, patch_version")
    @answers      = AnswersSearch.for_questions_and_certification(@questions, @certification)
    @subsections  = @section.subsections
    @top_sections = Section.top_level
  end

  private

  def set_default_section
    section_id = params[:section] || 1
    @section = Section.top_level.find_by_section_id(section_id)
  end

  def find_certification
    @certification = current_user.certifications.where(id: params[:certification_id]).first
  end
end
