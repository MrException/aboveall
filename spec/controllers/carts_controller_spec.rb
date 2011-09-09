require 'spec_helper'

describe CartsController do
  login_admin

  describe "GET show" do
    it "assigns the requested cart as @cart" do
      cart = Cart.create!
      get :show, :id => cart.id.to_s
      assigns(:cart).should eq(cart)
    end
  end

  describe "PUT update" do
    it "updates the cart" do
      Cart.any_instance.should_receive(:update_attributes).with({ 'nonsense' => 'params' })
      put :update, :id => 1, :cart => { 'nonsense' => 'params' }
    end
    
    it "redirects to the cart view" do
      put :update, :id => 1
      should redirect_to action: 'show'
    end
  end
end
