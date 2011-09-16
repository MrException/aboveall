require 'spec_helper'

describe ProductLineItemsController do
  login_user

  describe "POST create" do
    let(:pli) { FactoryGirl.create(:product_line_item) }
    let(:product) { pli.product }
    let(:cart) { controller.current_user.cart }

    describe "with valid params" do
      it "creates a new line item" do
        p = product
        expect {
          post :create, product_id: p.id
        }.to change(ProductLineItem, :count).by 1
      end

      it "redirects to the cart" do
        post :create, product_id: product.id
        response.should redirect_to(cart)
      end

      context "when the item is already in the cart" do
        before do
          cart.product_line_items << pli
        end

        it "doesn't add item twice" do
          expect {
            post :create, product_id: product.id
          }.to_not change(ProductLineItem, :count)
        end

        it "increases quantity when added twice" do
          post :create, product_id: product.id
          cart.product_line_items[0].quantity.should eq 2
        end
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
