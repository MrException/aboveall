require 'spec_helper'

describe Cart do
  it { should belong_to(:user) }
  it { should have_many(:product_line_items) }

  context "#empty" do
    it 'should remove all line items' do
      cart = FactoryGirl.build(:cart)
      cart.empty
      cart.product_line_items.should be_empty
    end
  end

  context "#pli_from_product" do
    it "it returns the proper line_item" do
      cart = FactoryGirl.build(:cart)
      pli = cart.product_line_items.first
      product = pli.product
      cart.pli_from_product(product).should eq pli
    end
    it "it returns nil when it should" do
      cart = FactoryGirl.build(:cart)
      product = mock_model(Product)
      cart.pli_from_product(product).should be_nil
    end
  end
end
