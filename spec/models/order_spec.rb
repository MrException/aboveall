require 'spec_helper'

describe Order do
  it { should belong_to(:user) }
  it { should have_many(:product_line_items) }

  let(:cart) { FactoryGirl.build(:cart) }

  context "#from_cart" do
    let(:order) { Order.from_cart(cart) }

    it "should copy the line items" do
      order.product_line_items.should eq cart.product_line_items
    end

    it "should copy the user" do
      order.user.should eq cart.user
    end
  end

  context "#checkout" do
    context "successful" do
      it "returns true when the the order save succeeds" do
        Order.any_instance.stub(:save!).and_return true
        Order.checkout(cart).should be_true
      end
      it "should empty the cart" do
        c = cart
        order = Order.checkout(c)
        c.should be_empty
      end
      it "should send an email" do
        c = cart
        c.user = FactoryGirl.build(:user)
        order = Order.checkout(c)
        last_email.to.should include(cart.user.email)
      end
    end

    context "unsuccessful" do
      it "returns false when the the order save fails" do
        Order.any_instance.stub(:save!).and_return false
        Order.checkout(cart).should be_false
      end
    end
  end

  context "#empty?" do
    it "should return true with no line items" do
      order = Order.new
      order.empty?.should be_true
    end

    it "should return false when there are line items" do
      order = Order.from_cart(cart)
      order.empty?.should be_false
    end
  end

  context "#total" do
    it "should return the some of the prices of the line items" do
      order = Order.from_cart(cart)
      Product.any_instance.stub(:price).and_return 9.99
      ProductLineItem.any_instance.stub(:quantity).and_return 2
      order.total.should == 19.98
    end
  end
end
