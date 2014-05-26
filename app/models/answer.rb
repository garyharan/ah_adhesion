class Answer < ActiveRecord::Base
  belongs_to :certification
  has_many :attachments

  def yes?
    value == true
  end
end
