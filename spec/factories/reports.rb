# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    name "John Doe"
    email "john@doe.com"
    body "I don't think they display their policy."

    association :answer, factory: :answer
  end
end
