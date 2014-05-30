FactoryGirl.define do
  factory :profile do
    sequence(:name) { |n| "John #{n}" }
    sequence(:city) { |n| "City #{n}" }
    sequence(:manager_name) { |n| "John the #{n}" }
    sequence(:manager_phone) { |n| "555-555#{n}" }
    sequence(:manager_email) { |n| "john#{n}@gmail.com" }

    trait :incomplete do
      name nil
    end

    trait :complete do
      name "Valid name"
      address "1514 Murray Street"
      city "Saint-Hubert"
      postal_code "J4T 1C7"
      telephone "514-909-4947"
      website "http://garyharan.com"
      member_number "9696"
      establishment_type "gite"
      classification "★★★★★"
      number_of_rooms "4"
      member_since "1978"
      director_name "Gary Haran"
      director_title "CEO"
      director_phone "514-909-4947"
      director_email "gary.haran@gmail.com"
      manager_name "Gary Haran"
      manager_title "CEO"
      manager_phone "514-909-4947"
      manager_email "gary.haran@gmail.com"
    end
  end
end
