class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_default_section
  before_filter :find_dossier
  after_action  :set_last_visited_section

  def index
    @questions    = Question.where(section_id: @section.section_id).order("subsection_id, patch_version")
    @answers      = AnswersSearch.for_questions_and_dossier(@questions, @dossier)
    @subsections  = @section.subsections
    @top_sections = Section.top_level
  end

  private

  def set_default_section
    section_id = params[:section] || current_user.last_visited_section_id || 1
    @section = Section.top_level.find_by_section_id(section_id)
  end

  def find_dossier
    @dossier = if current_user.admin?
      Dossier.find(params[:dossier_id])
    else
      current_user.dossiers.where(id: params[:dossier_id]).first
    end
  end

  def set_last_visited_section
    current_user.update_attribute :last_visited_section_id, @section.section_id
  end
end
