class Section < ActiveRecord::Base
  has_many :subsections, -> { order("subsection_id").where("subsection_id is not null") }, class_name: "Section", primary_key: :section_id

  scope :top_level, -> { where(subsection_id: nil) }

  def title
    "#{[section_id, subsection_id].join(".")}#{title_fr}"
  end
end
