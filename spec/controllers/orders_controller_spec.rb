require 'spec_helper'

describe OrdersController do
  login_user

  describe 'GET new' do
    it 'assigns a new order as @order' do
      get :new
      assigns(:order).should be_a_new(Order)
    end

    it 'should copy products from the cart' do
      cart = FactoryGirl.build(:cart)
      controller.current_user.cart = cart
      get :new
      assigns(:order).product_line_items.should eq cart.product_line_items
    end
  end

  describe 'POST create' do
    context 'successful' do
      before(:each) do
        cart = FactoryGirl.build(:cart)
        controller.current_user.cart = cart
      end

      it 'creates a new order' do
        expect {
          post :create
        }.to change(Order, :count).by(1)
      end

      it 'empties out the cart' do
        post :create
        controller.current_user.cart.product_line_items.should be_empty
      end
    end
  end
end
