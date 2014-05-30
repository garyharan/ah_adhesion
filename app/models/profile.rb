class Profile < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :city, :manager_name, :manager_phone, :manager_email

  include Completable
  completes_with :name, :city, :postal_code, :telephone, :website, :number_of_rooms, :director_name, :director_email, :director_phone, :manager_name, :manager_phone, :manager_email
end
