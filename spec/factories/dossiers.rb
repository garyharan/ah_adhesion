# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dossier do
    user_id 1
    approval_date "2014-04-28 10:06:12"

    trait :draft do
      state :draft
    end

    trait :pending_payment do
      state :pending_payment
    end

    trait :under_review do
      state :under_review
    end

    trait :approved do
      state :approved
    end

    trait :rejected do
      state :rejected
    end
  end
end
