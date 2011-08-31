require 'spec_helper'

describe Product do
  it { should have_many(:product_line_items) }
  describe "image attachment" do
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_content_type(:image).
         allowing('image/png', 'image/gif').
         rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:image).
         less_than(2.megabytes) }
  end

  it "should require fields" do
    p = Product.new
    p.should have(1).error_on(:title)
    p.should have(1).error_on(:description)
    p.should have(1).error_on(:unit)
    p.should have(2).errors_on(:price)
  end

  it "should validate proper price" do
    p = Factory.build(:product)
    p.price = -1
    p.should have(1).error_on(:price)
  end
end
