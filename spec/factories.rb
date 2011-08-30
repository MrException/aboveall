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
    after_build { |user| user.authorize! }

    factory :admin do
      email "admin@test.com"
      after_build { |user| user.make_admin! }
    end

    factory :dummy_user do
      sequence(:email) { |n| "user#{n}@test.com" }
      after_build { |user| user.unauthorize! }
    end
  end

  factory :product do
    sequence(:title) { |n| "Product Name #{n}" }
    description "A nice product description here."
    price 9.99
    unit 'g'
    image_file_name 'test_image.jpg'
    hidden false
  end
end
