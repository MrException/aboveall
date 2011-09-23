require 'spec_helper'

describe CartsController do
  login_admin


  let(:cart) { mock_model(Cart).as_null_object }

  before do
    Cart.stub(:find).and_return(cart)
    controller.current_user.stub(:cart).and_return cart
    cart.stub(:update_attributes).and_return true
  end

  describe "GET show" do
    it "assigns the requested cart as @cart" do
      get :show, :id => cart.id
      assigns(:cart).should eq(cart)
    end
  end

  describe "PUT update" do
    context "successful" do
      it "updates the cart" do
        cart.should_receive(:update_attributes).with({ 'nonsense' => 'params' })
        put :update, :id => cart.id, :cart => { 'nonsense' => 'params' }
      end

      it "redirects to the cart view" do
        put :update, :id => cart.id 
        should redirect_to controller.current_user.cart
      end
    end

    context "unsuccessful" do
      it "redirects to the shopping cart if save not successful" do
        cart.stub(:update_attributes).and_return false
        put :update, :id => cart.id
        should redirect_to controller.current_user.cart
        flash.alert.should_not be_nil
      end
    end
  end
end
