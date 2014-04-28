class Certification < ActiveRecord::Base
  belongs_to :user

  scope :pending, -> { where(state: 'pending') }

  state_machine :state, :initial => :draft do
    event :submit do
      transition :draft => :pending
    end

    event :approve do
      transition :pending => :approved
    end

    event :reject do
      transition :pending => :rejected
    end

    event :expire do
      transition :approved => :expired
    end
  end
end
