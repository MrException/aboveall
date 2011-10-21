include ActionDispatch::TestProcess

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
    password "please"
    password_confirmation "please"

    road "123 This Rd"
    city "Kelowna"
    province "BC"
    postal_code "a1a1a1"

    gender "M"
    dob Time.now

    possession_limit 60
    license_number "1234567890"
    license_expiry Time.now

    confirmed_at 1.year.ago

    sequence(:email) { |n| "user#{n}@test.com" }
    after_build { |user| user.authorize! }

    factory :admin do
      email "admin@test.com"
      after_build { |user| user.make_admin! }
    end

    factory :dummy_user do
      sequence(:email) { |n| "dummy-user#{n}@test.com" }
      after_build { |user| user.unauthorize! }
    end
  end

  factory :product do
    sequence(:title) { |n| "Product Name #{n}" }
    description "A nice product description here."
    short_description "A short description."
    price 9.99
    image { fixture_file_upload(File.join(Rails.root, 'spec/test_image.jpg'), 'image/jpg')  }
    hidden false
  end

  factory :product_line_item do
    quantity 1
    product
  end

  factory :cart do
    product_line_items { |pli| [pli.association(:product_line_item)] }
    user
  end

  factory :order do
    product_line_items { |pli| [pli.association(:product_line_item)] }
    user
  end

end
