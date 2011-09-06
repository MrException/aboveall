require 'spec_helper'

describe Cart do
  it { should belong_to(:user) }
  it { should have_many(:product_line_items) }

  it 'empty should remove all line items' do
    cart = FactoryGirl.build(:cart)
    cart.empty
    cart.product_line_items.should be_empty
  end
end
