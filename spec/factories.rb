FactoryGirl.define do
  factory :unauthorized_role, :class => Role do
    name "unauthorized"

    factory :authorized_role do
      name 'authorized'
    end

    factory :admin_role do
      name 'admin'
    end
  end

  factory :user do
    first_name "Bob"
    last_name "McGee"
    email "user@test.com"
    password "please"
    password_confirmation "please"
    association :role, :factory => :authorized_role

    factory :admin do
      email "admin@test.com"
      association :role, :factory => :admin_role
    end
  end

  factory :product do
    sequence(:title) { |n| "Product Name #{n}" }
    description "A nice product description here."
    price 9.99
    unit 'g'
    hidden false
  end
end
