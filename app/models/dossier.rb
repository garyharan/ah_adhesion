class Dossier < ActiveRecord::Base
  belongs_to :user
  has_one :profile, through: :user
  has_many :answers
  has_many :reports

  before_save :set_approval_date

  attr_readonly :reports_count

  POSSIBLE_STATES = {
    draft: "Brouillon",
    pending_payment: "Attente de paiement",
    under_review:  "En revue",
    approved: "Approuvé",
    rejected: "rejected",
  }

  default_scope           -> { order("id ASC") }
  scope :draft,           -> { where(state: :draft) }
  scope :pending_payment, -> { where(state: :pending_payment) }
  scope :under_review,    -> { where(state: :under_review) }
  scope :approved,        -> { where(state: :approved) }
  scope :rejected,        -> { where(state: :rejected) }

  state_machine :state, :initial => :draft do
    event :submit do
      transition :draft => :pending_payment
    end

    event :paid do
      transition :pending_payment => :under_review
    end

    event :approve do
      transition :under_review => :approved
    end

    event :reject do
      transition :under_review => :rejected
    end

    event :expire do
      transition :approved => :expired
    end
  end

  def score
    answers.where(value: true).count
  end

  def validated_score
    answers.where(value: true, validated: true).count
  end

  private

  def set_approval_date
    if state_changed? && self[:state] == :approved
      self[:approval_date] = DateTime.now
    end
  end
end
