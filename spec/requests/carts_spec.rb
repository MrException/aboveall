require 'spec_helper'

describe "Carts" do
  context 'just logged in' do
    it 'should only be visible to authorized users' do
      capy_login_new
      find('#navigation').should have_no_content 'Shopping Cart'
      click_button 'Logout'
      capy_login_admin
      find('#navigation').should have_content 'Shopping Cart'
    end

    it 'it should say there are no items in the cart' do
      capy_login_user
      click_link 'Shopping Cart'
      page.should have_content 'Your Cart Is Empty'
    end
  end

  context 'using cart' do
    let(:addproduct) do
      click_link 'Products'
      find('#products-list').click_on 'Product Image'
      click_button 'Add To Cart'
    end

    before(:each) do
      capy_login_user
      FactoryGirl.create(:product)
      addproduct
    end

    it 'should allow adding items to cart' do
      find('#cart-list').all('tbody tr').length.should eq 1
      page.should have_no_content 'Your Cart Is Empty'
    end

    it 'increases quantity when adding item twice' do
      addproduct
      find('#cart-list').all('tbody tr').length.should eq 1
    end

    it 'should persist over logging out' do
      click_button 'Logout'
      capy_login_user
      click_link 'Shopping Cart'
      find('#cart-list').all('tbody tr').length.should eq 1
      page.should have_no_content 'Your Cart Is Empty'
    end

    it 'should allow modifying quantities' do
      first('#cart-list input[type="text"]').set "2"
      click_button 'Update'
      page.should have_content 'Quantity'
      first('#cart-list input[type="text"]').value.should eq "2"
    end

    it 'should allow deleting products' do
      first('#cart-list input[type="checkbox"]').set "1"
      click_button 'Update'
      page.should have_content 'Your Cart Is Empty'
    end
  end
end
