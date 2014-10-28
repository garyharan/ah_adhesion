class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :dossiers
  has_one :profile

  def to_s
    email
  end

  def latest_dossier
    dossiers.last
  end
end
