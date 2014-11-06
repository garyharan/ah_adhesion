class Question < ActiveRecord::Base
  belongs_to :section, primary_key: "section_id"
  belongs_to :subsection, class_name: "Section", primary_key: "subsection_id"

  def widget_text(locale)
    locale = "en" unless ['en', 'fr'].include? locale.to_s
    send("widget_#{locale}")
  end
end
