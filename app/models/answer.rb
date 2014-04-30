class Answer < ActiveRecord::Base
  has_many :attachments

  def yes?
    value == true
  end
end
