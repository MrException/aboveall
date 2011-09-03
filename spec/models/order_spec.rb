require 'spec_helper'

describe Order do
  it { should belong_to(:user) }
  it { should have_many(:product_line_items) }
  
  it "should make a new order from a cart" do
    cart = FactoryGirl.build(:cart)
    order = Order.from_cart(cart)
    order.product_line_items.should eq cart.product_line_items
  end
end
