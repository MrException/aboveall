require 'spec_helper'

describe OrdersController do
  login_user

  describe 'GET new' do
    it 'assigns a new order as @order' do
      get :new
      assigns(:order).should be_a_new(Order)
    end

    it 'should copy products from the cart' do
      cart = FactoryGirl.create(:cart)
      controller.current_user.cart = cart
      get :new
      assigns(:order).product_line_items.should eq cart.product_line_items
    end
  end

  describe 'POST create' do
    it 'creates a new order' do
      expect {
        post :create
      }.to change(Order, :count).by(1)
    end
  end
end
