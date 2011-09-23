require 'spec_helper'

describe Order do
  it { should belong_to(:user) }
  it { should have_many(:product_line_items) }

  let(:cart) { FactoryGirl.build(:cart) }
  let(:order) { Order.from_cart(cart) }

  context "#from_cart" do
    it "should copy the line items" do
      order.product_line_items.should eq cart.product_line_items
    end

    it "should copy the user" do
      order.user.should eq cart.user
    end
  end

  context "#empty?" do
    it "should return true with no line items" do
      order = Order.new
      order.empty?.should be_true
    end

    it "should return false when there are line items" do
      order.empty?.should be_false
    end
  end

  context "#total" do
    it "should return the some of the prices of the line items" do
      Product.any_instance.stub(:price).and_return 9.99
      ProductLineItem.any_instance.stub(:quantity).and_return 2
      order.total.should == 19.98
    end
  end
end
