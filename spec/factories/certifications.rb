# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :certification do
    user_id 1
    status "MyString"
    approval_date "2014-04-28 10:06:12"
  end
end
