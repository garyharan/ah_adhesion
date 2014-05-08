class Profile < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :member_since, :manager_name, :manager_phone, :manager_email
end
