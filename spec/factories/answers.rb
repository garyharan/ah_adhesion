# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    dossier_id 1
    association :question, factory: :question
    value false

    trait :unvalidated do
      value true
    end

    trait :validated do
      value true
      validated true
    end
  end
end
