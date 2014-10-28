class Answer < ActiveRecord::Base
  belongs_to :dossier
  belongs_to :question
  has_many :attachments

  def yes?
    value == true
  end
end
