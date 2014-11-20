class Report < ActiveRecord::Base
  belongs_to :answer
  belongs_to :dossier, dependent: :destroy, counter_cache: true

  before_validation :connect_with_dossier

  validates_presence_of :name, :email, :body

  private

  def connect_with_dossier
    self.dossier = answer.dossier
  end
end
