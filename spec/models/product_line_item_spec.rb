require 'spec_helper'

describe ProductLineItem do
  it { should belong_to(:cart) }
  it { should belong_to(:product) }
end
