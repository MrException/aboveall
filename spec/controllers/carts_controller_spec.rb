require 'spec_helper'

describe CartsController do
  login_admin


  let(:cart) { mock_model(Cart).as_null_object }

  before do
    Cart.should_receive(:find).and_return(cart)
  end

  describe "GET show" do
    it "assigns the requested cart as @cart" do
      get :show, :id => cart.id
      assigns(:cart).should eq(cart)
    end
  end

  describe "PUT update" do
    it "updates the cart" do
      cart.should_receive(:update_attributes).with({ 'nonsense' => 'params' })
      put :update, :id => cart.id, :cart => { 'nonsense' => 'params' }
    end

    it "redirects to the cart view" do
      put :update, :id => cart.id 
      should redirect_to action: 'show'
    end
  end
end
