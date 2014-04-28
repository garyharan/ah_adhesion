class Section < ActiveRecord::Base
  has_many :section_questions, class_name: "Question", primary_key: :section_id, foreign_key: :section_id
  has_many :subsection_questions, class_name: "Question", primary_key: :subsection_id, foreign_key: :subsection_id

  has_many :subsections, -> { order("subsection_id") }, class_name: "Section", foreign_key: "parent_id", primary_key: :section_id
end
