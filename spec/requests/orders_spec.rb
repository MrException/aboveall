require 'spec_helper'

describe 'Orders' do
  it 'should be able to place an order' do
    capy_login_user
    FactoryGirl.create_list(:product, 1)
    click_link 'Products'
    find('.product-link a').click
    click_button 'Add To Cart'
    click_link 'Shopping Cart'
    click_button 'Checkout'
    page.should have_content 'Order Summary'
    find('#order-list').all('.product').length.should eq 1
    click_button 'Place Order'
    click_link 'Shopping Cart'
    page.should have_content 'Your Cart Is Empty'
  end
end
