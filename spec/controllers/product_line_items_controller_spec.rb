require 'spec_helper'

describe ProductLineItemsController do
  login_user

  describe "POST create" do
    let(:pli) { FactoryGirl.create(:product_line_item) }
    let(:product) { pli.product }
    let(:cart) { controller.current_user.cart }

    describe "with valid params" do
      before :each do
        Cart.stub!(add_product: true)
      end

      it "redirects to the cart" do
        post :create, product_id: product.id
        response.should redirect_to(cart)
      end
    end

    describe "with invalid params" do
      before :each do
        Cart.stub!(add_product: false)
      end

      it "redirects to root with error" do
        post :create, product_id: -1
        flash[:alert].should_not be_nil
        response.should redirect_to(root_path)
      end
    end
  end
end
