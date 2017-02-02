FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "foo#{n}" }
    sequence(:email) { |n| "foo#{n}@bar.com" }
    password "password"
    password_confirmation "password"
  end

  factory :pin do
    sequence(:item_name) { |n| "item #{n}" }
    description "words words words"
    purchase true
    association :user
  end
end
