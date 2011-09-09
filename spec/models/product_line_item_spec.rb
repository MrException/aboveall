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
end
