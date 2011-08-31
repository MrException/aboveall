require 'spec_helper'

describe Cart do
  it { should belong_to(:user) }
  it { should have_many(:product_line_items) }
end
