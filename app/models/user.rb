class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :certifications
  has_one :profile

  def to_s
    email
  end

  def latest_certification
    certifications.last
  end
end
