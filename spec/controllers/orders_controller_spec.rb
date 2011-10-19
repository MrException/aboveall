require 'spec_helper'

describe OrdersController do
  login_user

  let(:cart) { FactoryGirl.build(:cart) }

  before do
    controller.current_user.cart = cart
  end

  describe "GET new" do
    context "successful" do
      it "assigns a new order as @order" do
        get :new
        assigns(:order).should be_a_new(Order)
      end

      it "should copy products from the cart" do
        get :new
        assigns(:order).product_line_items.should eq cart.product_line_items
      end
    end

    context "unsuccessful" do
      it "forwards back to the cart when cart is empty" do
        cart.stub(:empty?).and_return true
        get :new
        should redirect_to controller.current_cart
      end

      it "forwards back to the cart when over license limit" do
        controller.stub!(cart_over_limit?: true)
        get :new
        should redirect_to controller.current_cart
      end
    end
  end

  describe "POST create" do
    context "successful" do
      it "creates a new order" do
        expect {
          post :create
        }.to change(Order, :count).by 1
      end

      it "empties out the cart" do
        post :create
        controller.current_user.cart.product_line_items.should be_empty
      end
    end

    context "unsuccessful" do
      it "forwards back to the cart when cart is empty" do
        cart.stub(:empty?).and_return true
        post :create
        should redirect_to controller.current_user.cart
      end

      it "forwards back to the new order screen on order save error" do
        Order.stub(:checkout).and_return false
        post :create
        should redirect_to new_order_path
      end

      it "forwards back to the cart when over license limit" do
        controller.stub!(cart_over_limit?: true)
        post :create
        should redirect_to controller.current_cart
      end
    end
  end
end
