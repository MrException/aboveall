FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "McGee"
    email "user@test.com"
    password "please"
    password_confirmation "please"
  end

  factory :product do
    sequence(:title) { |n| "Product Name #{n}" }
    description "A nice product description here."
    price 9.99
    unit 'g'
    hidden false
  end
end
