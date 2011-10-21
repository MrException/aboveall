require 'spec_helper'

describe 'Orders' do
  it 'should be able to place an order' do
    FactoryGirl.create(:product)
    capy_login_user
    click_link 'Products'
    find('#products-list').click_on 'Product Image'
    click_button 'Add To Cart'
    click_link 'Shopping Cart'
    click_button 'Checkout'
    page.should have_content 'Order Summary'
    all('#order-list tbody tr').length.should eq 1
    select "Credit Cart", from: "Payment method"
    click_on 'Update Payment'
    click_on 'Place Order'
    click_link 'Shopping Cart'
    page.should have_content 'Your Cart Is Empty'
  end
end
