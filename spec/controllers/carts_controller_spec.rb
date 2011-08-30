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
end
