FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "McGee"
    email "user@test.com"
    password "please"
    password_confirmation "please"
  end
end
