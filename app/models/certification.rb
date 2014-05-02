class Certification < ActiveRecord::Base
  belongs_to :user

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
  
  scope :pending_payment, -> { where(state: 'pending_payment') }
end
