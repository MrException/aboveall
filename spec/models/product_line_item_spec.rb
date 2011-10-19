require 'spec_helper'

describe ProductLineItem do
  it { should belong_to(:cart) }
  it { should belong_to(:product) }
  it { should have_db_column :quantity }
  it { should validate_numericality_of :quantity }

  it 'should have a quantity of 1 defaulted' do
    p = ProductLineItem.new
    p.quantity.should eq 1
  end

  context '#total' do
    it 'should have a proper total' do
      p = mock_model(Product, price: 9.9)
      pli = ProductLineItem.new({ quantity: 2, product: p })
      pli.total.should eq 19.8
    end
  end

  context '#from_product' do
    it 'should create a line item from a product' do
      p = mock_model(Product)
      pli = ProductLineItem.from_product(p)
      pli.product.should eq p
      pli.quantity.should eq 1
    end
  end
end
