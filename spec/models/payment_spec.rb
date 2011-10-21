require 'spec_helper'

describe Payment do
  it { should belong_to :user }
  it { should allow_mass_assignment_of :payment_method }
  it { should validate_presence_of :payment_method } 

  it "method should be a blank string after #new" do
    p = Payment.new
    p.payment_method.should eq ""
  end
end
