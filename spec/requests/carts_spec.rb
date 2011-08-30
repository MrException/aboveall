require 'spec_helper'

describe "Carts" do
  context 'just logged in' do
    it 'should only be visible to authorized users' do
      capy_login_new
      find('#nav-links').should have_no_content 'Shopping Cart'
      click_button 'Logout'
      capy_login_admin
      find('#nav-links').should have_content 'Shopping Cart'
    end

    it 'it should say there are no items in the cart' do
      capy_login_user
      click_link 'Shopping Cart'
      page.should have_content 'Empty'
    end

    it 'should allow adding items to cart' do
      capy_login_user
      FactoryGirl.create_list(:product, 5)
      click_link 'Products'
      find('.product-link a').click
      click_button 'Add To Cart'
      click_link 'Shopping Cart'
      find('#cart-list').all('.product').length.should eq 1
    end
  end
end
