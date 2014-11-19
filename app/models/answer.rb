class Answer < ActiveRecord::Base
  belongs_to :dossier
  belongs_to :question
  has_many :attachments
  has_many :reports

  def yes?
    value == true
  end
end
