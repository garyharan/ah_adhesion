class Report < ActiveRecord::Base
  belongs_to :answer

  validates_presence_of :name, :email, :body
end
