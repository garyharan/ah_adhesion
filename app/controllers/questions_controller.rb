class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_default_section

  def index
    @questions = Question.where(section: @section.id).order("subsection, patch")
  end

  private

  def set_default_section
    section_id = params[:section] || 1
    @section = Section.top_level.find_by_section_id(section_id)
  end
end
