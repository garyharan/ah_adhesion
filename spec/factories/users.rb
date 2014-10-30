FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person-#{n}@example.com" }
    password "8_character_long_password"

    trait :with_admin_rights do
      admin true
    end

    trait :with_profile do
      after(:create) do |instance|
        create :profile, user_id: instance.id
      end
    end
  end
end
