require 'spec_helper'

describe ProductLineItemsController do
  login_user

  before(:all) { @product = FactoryGirl.create(:product) }

  describe "POST create" do
    describe "with valid params" do
      it "creates a new line item" do
        expect {
          post :create, product_id: @product.id
        }.to change(ProductLineItem, :count).by 1
      end

      it "redirects to the cart" do
        post :create, product_id: @product.id
        response.should redirect_to(controller.current_user.cart)
      end
    end

    describe "with invalid params" do
      it "should not create a new line item" do
        expect {
          post :create, product_id: -1
        }.to_not change(ProductLineItem, :count).by 1
      end

      it "redirects to root with error" do
        post :create, product_id: -1
        flash[:alert].should_not be_nil
        response.should redirect_to(root_path)
      end
    end
  end
end
