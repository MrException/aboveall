require 'spec_helper'

describe Cart do
  it { should belong_to(:user) }
  it { should have_many(:product_line_items) }

  let (:cart) { cart = FactoryGirl.build(:cart) }

  context "#empty" do
    it 'should remove all line items' do
      cart.should_not be_empty
      cart.empty
      cart.product_line_items.should be_empty
      cart.should be_empty
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

  context "#total" do
    it "should return the sum of the prices of the line items" do
      cart = Cart.new
      3.times do
        cart.product_line_items << mock_model(ProductLineItem, total: 2)
      end
      cart.total.should == 6
    end
  end

  context "#total_weight" do
    it "should return the total weight" do
      cart = Cart.new
      3.times do
        cart.product_line_items << mock_model(ProductLineItem, quantity: 2)
      end
      cart.total_weight.should == 6
    end
  end

  context "#add_product" do
    let(:cart) { Cart.new }

    it "should succeed if the product exists" do
      Product.stub!(find: mock_model(Product))
      cart.add_product(1).should be_true
    end

    it "should fail if the product doesn't exists" do
      cart.add_product(-1).should be_false
    end

    it "shouldn't add the product twice" do
      Product.stub!(find: mock_model(Product))
      cart.add_product(1)
      cart.add_product(1)
      cart.product_line_items.length.should eq 1
    end

    it "shouldn increase the quantity when adding product twice" do
      Product.stub!(find: mock_model(Product))
      cart.add_product(1)
      cart.add_product(1)
      cart.product_line_items.first.quantity.should eq 2
    end
  end
end
