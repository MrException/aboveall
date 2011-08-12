FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "McGee"
    email "user@test.com"
    password "please"
    password_confirmation "please"
  end

  factory :product do
    title 'Sticky Budz'
    description "Some sweet, sweet mary jane. It'll get you stoned!"
    price 9.99
    unit 'g'
    hidden false
  end
end
