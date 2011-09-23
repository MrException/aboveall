require 'spec_helper'

describe Cart do
  it { should belong_to(:user) }
  it { should have_many(:product_line_items) }

  let (:cart) { cart = FactoryGirl.build(:cart) }

  context "#empty" do
    it 'should remove all line items' do
      cart.empty
      cart.product_line_items.should be_empty
    end
  end

  context "#pli_from_product" do
    it "it returns the proper line_item" do
      pli = cart.product_line_items.first
      product = pli.product
      cart.pli_from_product(product).should eq pli
    end
    it "it returns nil when it should" do
      product = mock_model(Product)
      cart.pli_from_product(product).should be_nil
    end
  end

  context "#empty?" do
    it "should return true with no line items" do
      cart.empty
      cart.empty?.should be_true
    end

    it "should return false when there are line items" do
      cart.empty?.should be_false
    end
  end

  context "#total" do
    it "should return the some of the prices of the line items" do
      Product.any_instance.stub(:price).and_return 9.99
      ProductLineItem.any_instance.stub(:quantity).and_return 2
      cart.total.should == 19.98
    end
  end
end
