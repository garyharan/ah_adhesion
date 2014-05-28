# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    certification_id 1
    question_id 1
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
